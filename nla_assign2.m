% Problem 9(b)(i)
x = single(1);
y = single(1.0001);
x_d = double(1);
y_d = double(1.0001);
true = y_d^4 - x_d^4;

orig = y^4 - x^4;

z = single(0.0001);
w = y + x;
p = y^2 + x^2;
improv = p*z*w;

orig_rel = (orig/true) - 1;
improv_rel = (improv/true) - 1;


% Problem 9(b)(ii)
x1 = single(1);
y1 = single(1.0001);
x1_d = double(1);
y1_d = double(1.0001);
true1 = cos((pi*y1_d) / (2*x1_d));

orig1 = cos((pi*y1) / (2*x1));

improv1 = sin((pi*(x1-y1)) / (2*x1));

orig1_rel = (orig1/true1) - 1;
improv1_rel = (improv1/true1) - 1;


% Problem 10(b)
Ai = [1 2; 1 2];
Aii = [1 1; 2 2];
Aiii = [1 1; 1 2];
b = [1; 2];

xi = lsqminnorm(Ai,b,'warn');
xii = lsqminnorm(Aii,b,'warn');
xiii = lsqminnorm(Aiii,b,'warn');