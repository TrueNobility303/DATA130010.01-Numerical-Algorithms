
clear;
rng(42);
n = 100;
A = randn(n,n);
A = A' * A;
b = randn(n,1);
x_ast = A \ b;
max_iter = 200;
tol = 1e-8;

G0 =  10 * A;
x0 = zeros(n,1);

err_classical = BFGS_for_quatratic(x0, x_ast,A, G0, max_iter,tol, 'classical');
err_greedy    = BFGS_for_quatratic(x0, x_ast,A, G0, max_iter,tol, 'greedy');
err_random    = BFGS_for_quatratic(x0, x_ast,A, G0, max_iter,tol, 'random');

clf;
semilogy(err_classical);
hold on;
semilogy(err_greedy);
hold on;
semilogy(err_random);
legend('classical','greedy','random');
xlabel('iteration');
ylabel('residual');

function err = BFGS_for_quatratic(x, x_ast,A, G, max_iter,tol, type)

    r = residual(x,x_ast,A);
    err = [r];
    iter = 0;
    while r > tol
        if strcmp(type, 'classical') == 1
            [G,x] = classical_step(G,A,x,x_ast);
        end
        if strcmp(type, 'greedy') == 1
           [G,x] = greedy_step(G,A,x,x_ast);
        end
        if strcmp(type, 'random') == 1
           [G,x] = random_step(G,A,x,x_ast);
        end
        
        r = residual(x,x_ast,A);
        err = [err, r]; 
        iter = iter +1;
        fprintf('==%s== iter: %03d, residual: %.3e\n',type,iter,r);
        if iter > max_iter
            fprintf("%s not converge\n",type);
            break; 
        end
    end
end

function [G,x] = classical_step(G,A,x,x_ast)
    x_plus = x - G \ grad(x,x_ast,A); 
    u = x_plus - x;
    x = x_plus;
    G = BFGS(G,A,u);
end

function [G,x] = greedy_step(G,A,x,x_ast)
    x = x - G \ grad(x,x_ast,A);
    n = length(x);
    u = zeros(n,1);
    
    G_half = chol(G);
    B = G_half * inv(A) * G_half';
    [~,idx] = max(diag(B));
    u(idx) = 1;
    u = G_half  \ u;
    G = BFGS(G,A,u);
end

function [G,x] = random_step(G,A,x,x_ast)
    x = x - G \ grad(x,x_ast,A);
    n = length(x);
    G_half = chol(G);
    u = randn([n,1]);
    u = G_half  \ u;
    G = BFGS(G,A,u);
end

function g = grad(x,x_ast,A)
    g = A * (x - x_ast);
end
function r = residual(x,x_ast, A)
    r = x - x_ast;
    r = r' * A * r; 
end

function G_plus = BFGS(G, A, u)
    G_plus = G - (G*u)*(u'*G) / (u'*G*u) + (A*u)*(u'*A) / (u'*A*u);
end