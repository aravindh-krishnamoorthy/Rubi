
(* ::Subsection::Closed:: *)
(* 2.2 (c+d x)^m (F^(g (e+f x)))^n (a+b (F^(g (e+f x)))^n)^p *)
Int[(c_. + d_.*x_)^ m_.*(F_^(g_.*(e_. + f_.*x_)))^ n_./(a_ + b_.*(F_^(g_.*(e_. + f_.*x_)))^n_.), x_Symbol] := (c + d*x)^m/(b*f*g*n*Log[F])*Log[1 + b*(F^(g*(e + f*x)))^n/a] - d*m/(b*f*g*n*Log[F])* Int[(c + d*x)^(m - 1)*Log[1 + b*(F^(g*(e + f*x)))^n/a], x] /; FreeQ[{F, a, b, c, d, e, f, g, n}, x] && IGtQ[m, 0]
Int[(c_. + d_.*x_)^m_.*(F_^(g_.*(e_. + f_.*x_)))^ n_.*(a_. + b_.*(F_^(g_.*(e_. + f_.*x_)))^n_.)^p_., x_Symbol] := (c + d*x)^ m*(a + b*(F^(g*(e + f*x)))^n)^(p + 1)/(b*f*g*n*(p + 1)* Log[F]) - d*m/(b*f*g*n*(p + 1)*Log[F])* Int[(c + d*x)^(m - 1)*(a + b*(F^(g*(e + f*x)))^n)^(p + 1), x] /; FreeQ[{F, a, b, c, d, e, f, g, m, n, p}, x] && NeQ[p, -1]
Int[(c_. + d_.*x_)^m_.*(F_^(g_.*(e_. + f_.*x_)))^ n_.*(a_. + b_.*(F_^(g_.*(e_. + f_.*x_)))^n_.)^p_., x_Symbol] := Unintegrable[(c + d*x)^m*(F^(g*(e + f*x)))^ n*(a + b*(F^(g*(e + f*x)))^n)^p, x] /; FreeQ[{F, a, b, c, d, e, f, g, m, n, p}, x]
Int[(c_. + d_.*x_)^m_.*(k_.*G_^(j_.*(h_. + i_.*x_)))^ q_.*(a_. + b_.*(F_^(g_.*(e_. + f_.*x_)))^n_.)^p_., x_Symbol] := (k*G^(j*(h + i*x)))^q/(F^(g*(e + f*x)))^n* Int[(c + d*x)^m*(F^(g*(e + f*x)))^n*(a + b*(F^(g*(e + f*x)))^n)^p, x] /; FreeQ[{F, a, b, c, d, e, f, g, h, i, j, k, m, n, p, q}, x] && EqQ[f*g*n*Log[F] - i*j*q*Log[G], 0] && NeQ[(k*G^(j*(h + i*x)))^q - (F^(g*(e + f*x)))^n, 0]
