
(* ::Subsection::Closed:: *)
(* 7.3.6 Exponentials of inverse hyperbolic tangent *)
Int[E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := Int[((1 + a*x)^((n + 1)/2)/((1 - a*x)^((n - 1)/2)* Sqrt[1 - a^2*x^2])), x] /; FreeQ[a, x] && IntegerQ[(n - 1)/2]
Int[x_^m_.*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := Int[x^m*((1 + a*x)^((n + 1)/2)/((1 - a*x)^((n - 1)/2)* Sqrt[1 - a^2*x^2])), x] /; FreeQ[{a, m}, x] && IntegerQ[(n - 1)/2]
Int[E^(n_*ArcTanh[a_.*x_]), x_Symbol] := Int[(1 + a*x)^(n/2)/(1 - a*x)^(n/2), x] /; FreeQ[{a, n}, x] && Not[IntegerQ[(n - 1)/2]]
Int[x_^m_.*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := Int[x^m*(1 + a*x)^(n/2)/(1 - a*x)^(n/2), x] /; FreeQ[{a, m, n}, x] && Not[IntegerQ[(n - 1)/2]]
Int[(c_ + d_.*x_)^p_.*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := c^n*Int[(c + d*x)^(p - n)*(1 - a^2*x^2)^(n/2), x] /; FreeQ[{a, c, d, p}, x] && EqQ[a*c + d, 0] && IntegerQ[(n - 1)/2] && IntegerQ[2*p]
Int[(e_. + f_.*x_)^m_.*(c_ + d_.*x_)^p_.*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := c^n*Int[(e + f*x)^m*(c + d*x)^(p - n)*(1 - a^2*x^2)^(n/2), x] /; FreeQ[{a, c, d, e, f, m, p}, x] && EqQ[a*c + d, 0] && IntegerQ[(n - 1)/2] && (IntegerQ[p] || EqQ[p, n/2] || EqQ[p - n/2 - 1, 0]) && IntegerQ[2*p]
Int[u_.*(c_ + d_.*x_)^p_.*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := c^p*Int[u*(1 + d*x/c)^p*(1 + a*x)^(n/2)/(1 - a*x)^(n/2), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[a^2*c^2 - d^2, 0] && (IntegerQ[p] || GtQ[c, 0])
Int[u_.*(c_ + d_.*x_)^p_.*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := Int[u*(c + d*x)^p*(1 + a*x)^(n/2)/(1 - a*x)^(n/2), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[a^2*c^2 - d^2, 0] && Not[IntegerQ[p] || GtQ[c, 0]]
Int[u_.*(c_ + d_./x_)^p_.*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := d^p*Int[u*(1 + c*x/d)^p*E^(n*ArcTanh[a*x])/x^p, x] /; FreeQ[{a, c, d, n}, x] && EqQ[c^2 - a^2*d^2, 0] && IntegerQ[p]
Int[u_.*(c_ + d_./x_)^p_*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := (-1)^(n/2)*c^p* Int[u*(1 + d/(c*x))^p*(1 + 1/(a*x))^(n/2)/(1 - 1/(a*x))^(n/2), x] /; FreeQ[{a, c, d, p}, x] && EqQ[c^2 - a^2*d^2, 0] && Not[IntegerQ[p]] && IntegerQ[n/2] && GtQ[c, 0]
Int[u_.*(c_ + d_./x_)^p_*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := Int[u*(c + d/x)^p*(1 + a*x)^(n/2)/(1 - a*x)^(n/2), x] /; FreeQ[{a, c, d, p}, x] && EqQ[c^2 - a^2*d^2, 0] && Not[IntegerQ[p]] && IntegerQ[n/2] && Not[GtQ[c, 0]]
Int[u_.*(c_ + d_./x_)^p_*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := x^p*(c + d/x)^p/(1 + c*x/d)^p* Int[u*(1 + c*x/d)^p*E^(n*ArcTanh[a*x])/x^p, x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[c^2 - a^2*d^2, 0] && Not[IntegerQ[p]]
Int[E^(n_*ArcTanh[a_.*x_])/(c_ + d_.*x_^2)^(3/2), x_Symbol] := (n - a*x)* E^(n*ArcTanh[a*x])/(a*c*(n^2 - 1)*Sqrt[c + d*x^2]) /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[n]]
Int[(c_ + d_.*x_^2)^p_*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := (n + 2*a*(p + 1)*x)*(c + d*x^2)^(p + 1)* E^(n*ArcTanh[a*x])/(a*c*(n^2 - 4*(p + 1)^2)) - 2*(p + 1)*(2*p + 3)/(c*(n^2 - 4*(p + 1)^2))* Int[(c + d*x^2)^(p + 1)*E^(n*ArcTanh[a*x]), x] /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && LtQ[p, -1] && Not[IntegerQ[n]] && NeQ[n^2 - 4*(p + 1)^2, 0] && IntegerQ[2*p]
Int[E^(n_.*ArcTanh[a_.*x_])/(c_ + d_.*x_^2), x_Symbol] := E^(n*ArcTanh[a*x])/(a*c*n) /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[n/2]]
Int[(c_ + d_.*x_^2)^p_.*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := c^p*Int[(1 - a^2*x^2)^(p - n/2)*(1 + a*x)^n, x] /; FreeQ[{a, c, d, p}, x] && EqQ[a^2*c + d, 0] && IntegerQ[p] && IGtQ[(n + 1)/2, 0] && Not[IntegerQ[p - n/2]]
Int[(c_ + d_.*x_^2)^p_.*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := c^p*Int[(1 - a^2*x^2)^(p + n/2)/(1 - a*x)^n, x] /; FreeQ[{a, c, d, p}, x] && EqQ[a^2*c + d, 0] && IntegerQ[p] && ILtQ[(n - 1)/2, 0] && Not[IntegerQ[p - n/2]]
Int[(c_ + d_.*x_^2)^p_.*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := c^p*Int[(1 - a*x)^(p - n/2)*(1 + a*x)^(p + n/2), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[a^2*c + d, 0] && (IntegerQ[p] || GtQ[c, 0])
Int[(c_ + d_.*x_^2)^p_.*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := c^(n/2)*Int[(c + d*x^2)^(p - n/2)*(1 + a*x)^n, x] /; FreeQ[{a, c, d, p}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[p] || GtQ[c, 0]] && IGtQ[n/2, 0]
Int[(c_ + d_.*x_^2)^p_.*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := 1/c^(n/2)*Int[(c + d*x^2)^(p + n/2)/(1 - a*x)^n, x] /; FreeQ[{a, c, d, p}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[p] || GtQ[c, 0]] && ILtQ[n/2, 0]
Int[(c_ + d_.*x_^2)^p_*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := c^IntPart[p]*(c + d*x^2)^FracPart[p]/(1 - a^2*x^2)^FracPart[p]* Int[(1 - a^2*x^2)^p*E^(n*ArcTanh[a*x]), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[p] || GtQ[c, 0]]
Int[x_*E^(n_*ArcTanh[a_.*x_])/(c_ + d_.*x_^2)^(3/2), x_Symbol] := (1 - a*n*x)* E^(n*ArcTanh[a*x])/(d*(n^2 - 1)*Sqrt[c + d*x^2]) /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[n]]
Int[x_*(c_ + d_.*x_^2)^p_*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := (c + d*x^2)^(p + 1)* E^(n*ArcTanh[a*x])/(2*d*(p + 1)) - a*c*n/(2*d*(p + 1))*Int[(c + d*x^2)^p*E^(n*ArcTanh[a*x]), x] /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && LtQ[p, -1] && Not[IntegerQ[n]] && IntegerQ[2*p]
(* Int[x_*(c_+d_.*x_^2)^p_*E^(n_*ArcTanh[a_.*x_]),x_Symbol] :=  -(2*(p+1)+a*n*x)*(c+d*x^2)^(p+1)*E^(n*ArcTanh[a*x])/(d*(n^2-4*(p+1)^2) ) - n*(2*p+3)/(a*c*(n^2-4*(p+1)^2))*Int[(c+d*x^2)^(p+1)*E^(n*ArcTanh[a* x]),x] /; FreeQ[{a,c,d,n},x] && EqQ[a^2*c+d,0] && LeQ[p,-1] &&  NeQ[n^2-4*(p+1)^2,0] && Not[IntegerQ[n]] *)
Int[x_^2*(c_ + d_.*x_^2)^p_.*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := (1 - a*n*x)*(c + d*x^2)^(p + 1)* E^(n*ArcTanh[a*x])/(a*d*n*(n^2 - 1)) /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && EqQ[n^2 + 2*(p + 1), 0] && Not[IntegerQ[n]]
Int[x_^2*(c_ + d_.*x_^2)^p_*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := -(n + 2*(p + 1)*a*x)*(c + d*x^2)^(p + 1)* E^(n*ArcTanh[a*x])/(a*d*(n^2 - 4*(p + 1)^2)) + (n^2 + 2*(p + 1))/(d*(n^2 - 4*(p + 1)^2))* Int[(c + d*x^2)^(p + 1)*E^(n*ArcTanh[a*x]), x] /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && LtQ[p, -1] && Not[IntegerQ[n]] && NeQ[n^2 - 4*(p + 1)^2, 0] && IntegerQ[2*p]
Int[x_^m_.*(c_ + d_.*x_^2)^p_.*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := c^p*Int[x^m*(1 - a^2*x^2)^(p - n/2)*(1 + a*x)^n, x] /; FreeQ[{a, c, d, m, p}, x] && EqQ[a^2*c + d, 0] && (IntegerQ[p] || GtQ[c, 0]) && IGtQ[(n + 1)/2, 0] && Not[IntegerQ[p - n/2]]
Int[x_^m_.*(c_ + d_.*x_^2)^p_.*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := c^p*Int[x^m*(1 - a^2*x^2)^(p + n/2)/(1 - a*x)^n, x] /; FreeQ[{a, c, d, m, p}, x] && EqQ[a^2*c + d, 0] && (IntegerQ[p] || GtQ[c, 0]) && ILtQ[(n - 1)/2, 0] && Not[IntegerQ[p - n/2]]
Int[x_^m_.*(c_ + d_.*x_^2)^p_.*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := c^p*Int[x^m*(1 - a*x)^(p - n/2)*(1 + a*x)^(p + n/2), x] /; FreeQ[{a, c, d, m, n, p}, x] && EqQ[a^2*c + d, 0] && (IntegerQ[p] || GtQ[c, 0])
Int[x_^m_.*(c_ + d_.*x_^2)^p_.*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := c^(n/2)*Int[x^m*(c + d*x^2)^(p - n/2)*(1 + a*x)^n, x] /; FreeQ[{a, c, d, m, p}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[p] || GtQ[c, 0]] && IGtQ[n/2, 0]
Int[x_^m_.*(c_ + d_.*x_^2)^p_.*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := 1/c^(n/2)*Int[x^m*(c + d*x^2)^(p + n/2)/(1 - a*x)^n, x] /; FreeQ[{a, c, d, m, p}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[p] || GtQ[c, 0]] && ILtQ[n/2, 0]
Int[x_^m_.*(c_ + d_.*x_^2)^p_*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := c^IntPart[p]*(c + d*x^2)^FracPart[p]/(1 - a^2*x^2)^FracPart[p]* Int[x^m*(1 - a^2*x^2)^p*E^(n*ArcTanh[a*x]), x] /; FreeQ[{a, c, d, m, n, p}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[p] || GtQ[c, 0]] && Not[IntegerQ[n/2]]
Int[u_*(c_ + d_.*x_^2)^p_.*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := c^p*Int[u*(1 - a*x)^(p - n/2)*(1 + a*x)^(p + n/2), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[a^2*c + d, 0] && (IntegerQ[p] || GtQ[c, 0])
Int[u_*(c_ + d_.*x_^2)^p_*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := c^IntPart[p]*(c + d*x^2)^ FracPart[p]/((1 - a*x)^FracPart[p]*(1 + a*x)^FracPart[p])* Int[u*(1 - a*x)^(p - n/2)*(1 + a*x)^(p + n/2), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[p] || GtQ[c, 0]] && IntegerQ[n/2]
Int[u_*(c_ + d_.*x_^2)^p_*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := c^IntPart[p]*(c + d*x^2)^FracPart[p]/(1 - a^2*x^2)^FracPart[p]* Int[u*(1 - a^2*x^2)^p*E^(n*ArcTanh[a*x]), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[p] || GtQ[c, 0]] && Not[IntegerQ[n/2]]
Int[u_.*(c_ + d_./x_^2)^p_.*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := d^p*Int[u/x^(2*p)*(1 - a^2*x^2)^p*E^(n*ArcTanh[a*x]), x] /; FreeQ[{a, c, d, n}, x] && EqQ[c + a^2*d, 0] && IntegerQ[p]
Int[u_.*(c_ + d_./x_^2)^p_*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := c^p*Int[u*(1 - 1/(a*x))^p*(1 + 1/(a*x))^p*E^(n*ArcTanh[a*x]), x] /; FreeQ[{a, c, d, p}, x] && EqQ[c + a^2*d, 0] && Not[IntegerQ[p]] && IntegerQ[n/2] && GtQ[c, 0]
Int[u_.*(c_ + d_./x_^2)^p_*E^(n_*ArcTanh[a_.*x_]), x_Symbol] := x^(2*p)*(c + d/x^2)^p/((1 - a*x)^p*(1 + a*x)^p)* Int[u/x^(2*p)*(1 - a*x)^p*(1 + a*x)^p*E^(n*ArcTanh[a*x]), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[c + a^2*d, 0] && Not[IntegerQ[p]] && IntegerQ[n/2] && Not[GtQ[c, 0]]
Int[u_.*(c_ + d_./x_^2)^p_*E^(n_.*ArcTanh[a_.*x_]), x_Symbol] := x^(2*p)*(c + d/x^2)^p/(1 + c*x^2/d)^p* Int[u/x^(2*p)*(1 + c*x^2/d)^p*E^(n*ArcTanh[a*x]), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[c + a^2*d, 0] && Not[IntegerQ[p]] && Not[IntegerQ[n/2]]
Int[E^(n_.*ArcTanh[c_.*(a_ + b_.*x_)]), x_Symbol] := Int[(1 + a*c + b*c*x)^(n/2)/(1 - a*c - b*c*x)^(n/2), x] /; FreeQ[{a, b, c, n}, x]
Int[x_^m_*E^(n_*ArcTanh[c_.*(a_ + b_.*x_)]), x_Symbol] := 4/(n*b^(m + 1)*c^(m + 1))* Subst[ Int[x^(2/n)*(-1 - a*c + (1 - a*c)*x^(2/n))^ m/(1 + x^(2/n))^(m + 2), x], x, (1 + c*(a + b*x))^(n/2)/(1 - c*(a + b*x))^(n/2)] /; FreeQ[{a, b, c}, x] && ILtQ[m, 0] && LtQ[-1, n, 1]
Int[(d_. + e_.*x_)^m_.*E^(n_.*ArcTanh[c_.*(a_ + b_.*x_)]), x_Symbol] := Int[(d + e*x)^m*(1 + a*c + b*c*x)^(n/2)/(1 - a*c - b*c*x)^(n/2), x] /; FreeQ[{a, b, c, d, e, m, n}, x]
Int[u_.*(c_ + d_.*x_ + e_.*x_^2)^p_.*E^(n_.*ArcTanh[a_ + b_.*x_]), x_Symbol] := (c/(1 - a^2))^p* Int[u*(1 - a - b*x)^(p - n/2)*(1 + a + b*x)^(p + n/2), x] /; FreeQ[{a, b, c, d, e, n, p}, x] && EqQ[b*d - 2*a*e, 0] && EqQ[b^2*c + e (1 - a^2), 0] && (IntegerQ[p] || GtQ[c/(1 - a^2), 0])
Int[u_.*(c_ + d_.*x_ + e_.*x_^2)^p_.*E^(n_.*ArcTanh[a_ + b_.*x_]), x_Symbol] := (c + d*x + e*x^2)^p/(1 - a^2 - 2*a*b*x - b^2*x^2)^p* Int[u*(1 - a^2 - 2*a*b*x - b^2*x^2)^p*E^(n*ArcTanh[a*x]), x] /; FreeQ[{a, b, c, d, e, n, p}, x] && EqQ[b*d - 2*a*e, 0] && EqQ[b^2*c + e (1 - a^2), 0] && Not[IntegerQ[p] || GtQ[c/(1 - a^2), 0]]
Int[u_.*E^(n_.*ArcTanh[c_./(a_. + b_.*x_)]), x_Symbol] := Int[u*E^(n*ArcCoth[a/c + b*x/c]), x] /; FreeQ[{a, b, c, n}, x]
Int[u_.*E^(n_*ArcCoth[a_.*x_]), x_Symbol] := (-1)^(n/2)*Int[u*E^(n*ArcTanh[a*x]), x] /; FreeQ[a, x] && IntegerQ[n/2]
Int[E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := -Subst[ Int[(1 + x/a)^((n + 1)/2)/(x^2*(1 - x/a)^((n - 1)/2)* Sqrt[1 - x^2/a^2]), x], x, 1/x] /; FreeQ[a, x] && IntegerQ[(n - 1)/2]
Int[x_^m_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := -Subst[ Int[(1 + x/a)^((n + 1)/2)/(x^(m + 2)*(1 - x/a)^((n - 1)/2)* Sqrt[1 - x^2/a^2]), x], x, 1/x] /; FreeQ[a, x] && IntegerQ[(n - 1)/2] && IntegerQ[m]
Int[E^(n_*ArcCoth[a_.*x_]), x_Symbol] := -Subst[ Int[(1 + x/a)^(n/2)/(x^2*(1 - x/a)^(n/2)), x], x, 1/x] /; FreeQ[{a, n}, x] && Not[IntegerQ[n]]
Int[x_^m_.*E^(n_*ArcCoth[a_.*x_]), x_Symbol] := -Subst[ Int[(1 + x/a)^(n/2)/(x^(m + 2)*(1 - x/a)^(n/2)), x], x, 1/x] /; FreeQ[{a, n}, x] && Not[IntegerQ[n]] && IntegerQ[m]
Int[x_^m_*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := -x^m*(1/x)^m* Subst[Int[(1 + x/a)^((n + 1)/2)/(x^(m + 2)*(1 - x/a)^((n - 1)/2)* Sqrt[1 - x^2/a^2]), x], x, 1/x] /; FreeQ[{a, m}, x] && IntegerQ[(n - 1)/2] && Not[IntegerQ[m]]
Int[x_^m_*E^(n_*ArcCoth[a_.*x_]), x_Symbol] := -x^m*(1/x)^m* Subst[Int[(1 + x/a)^(n/2)/(x^(m + 2)*(1 - x/a)^(n/2)), x], x, 1/x] /; FreeQ[{a, m, n}, x] && Not[IntegerQ[n]] && Not[IntegerQ[m]]
Int[(c_ + d_.*x_)^p_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := (1 + a*x)*(c + d*x)^p* E^(n*ArcCoth[a*x])/(a*(p + 1)) /; FreeQ[{a, c, d, n, p}, x] && EqQ[a*c + d, 0] && EqQ[p, n/2] && Not[IntegerQ[n/2]]
(* Int[(c_+d_.*x_)^p_.*E^(n_.*ArcCoth[a_.*x_]),x_Symbol] :=  -(-a)^n*c^n*Subst[Int[(d+c*x)^(p-n)*(1-x^2/a^2)^(n/2)/x^(p+2),x],x,1/ x] /; FreeQ[{a,c,d},x] && EqQ[a*c+d,0] && IntegerQ[(n-1)/2] &&  IntegerQ[p] *)
(* Int[x_^m_.*(c_+d_.*x_)^p_.*E^(n_.*ArcCoth[a_.*x_]),x_Symbol] :=  -(-a)^n*c^n*Subst[Int[(d+c*x)^(p-n)*(1-x^2/a^2)^(n/2)/x^(m+p+2),x],x, 1/x] /; FreeQ[{a,c,d},x] && EqQ[a*c+d,0] && IntegerQ[(n-1)/2] &&  IntegerQ[m] && IntegerQ[p] *)
(* Int[(c_+d_.*x_)^p_.*E^(n_.*ArcCoth[a_.*x_]),x_Symbol] :=  -(-a)^n*c^n*Sqrt[c+d*x]/(Sqrt[x]*Sqrt[d+c/x])*Subst[Int[(d+c*x)^(p-n)* (1-x^2/a^2)^(n/2)/x^(p+2),x],x,1/x] /; FreeQ[{a,c,d},x] &&  EqQ[a*c+d,0] && IntegerQ[(n-1)/2] && IntegerQ[p-1/2] *)
(* Int[x_^m_.*(c_+d_.*x_)^p_.*E^(n_.*ArcCoth[a_.*x_]),x_Symbol] :=  -(-a)^n*c^n*Sqrt[c+d*x]/(Sqrt[x]*Sqrt[d+c/x])*Subst[Int[(d+c*x)^(p-n)* (1-x^2/a^2)^(n/2)/x^(m+p+2),x],x,1/x] /; FreeQ[{a,c,d},x] &&  EqQ[a*c+d,0] && IntegerQ[(n-1)/2] && IntegerQ[m] && IntegerQ[p-1/2] *)
Int[u_.*(c_ + d_.*x_)^p_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := d^p*Int[u*x^p*(1 + c/(d*x))^p*E^(n*ArcCoth[a*x]), x] /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c^2 - d^2, 0] && Not[IntegerQ[n/2]] && IntegerQ[p]
Int[u_.*(c_ + d_.*x_)^p_*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := (c + d*x)^p/(x^p*(1 + c/(d*x))^p)* Int[u*x^p*(1 + c/(d*x))^p*E^(n*ArcCoth[a*x]), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[a^2*c^2 - d^2, 0] && Not[IntegerQ[n/2]] && Not[IntegerQ[p]]
Int[(c_ + d_./x_)^p_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := -c^n* Subst[Int[(c + d*x)^(p - n)*(1 - x^2/a^2)^(n/2)/x^2, x], x, 1/x] /; FreeQ[{a, c, d, p}, x] && EqQ[c + a*d, 0] && IntegerQ[(n - 1)/2] && (IntegerQ[p] || EqQ[p, n/2] || EqQ[p, n/2 + 1]) && IntegerQ[2*p]
Int[x_^m_.*(c_ + d_./x_)^p_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := -c^n* Subst[Int[(c + d*x)^(p - n)*(1 - x^2/a^2)^(n/2)/x^(m + 2), x], x, 1/x] /; FreeQ[{a, c, d, p}, x] && EqQ[c + a*d, 0] && IntegerQ[(n - 1)/2] && IntegerQ[ m] && (IntegerQ[p] || EqQ[p, n/2] || EqQ[p, n/2 + 1] || LtQ[-5, m, -1]) && IntegerQ[2*p]
Int[(c_ + d_./x_)^p_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := -c^p* Subst[Int[(1 + d*x/c)^p*(1 + x/a)^(n/2)/(x^2*(1 - x/a)^(n/2)), x], x, 1/x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[c^2 - a^2*d^2, 0] && Not[IntegerQ[n/2]] && (IntegerQ[p] || GtQ[c, 0])
Int[x_^m_.*(c_ + d_./x_)^p_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := -c^p* Subst[Int[(1 + d*x/c)^ p*(1 + x/a)^(n/2)/(x^(m + 2)*(1 - x/a)^(n/2)), x], x, 1/x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[c^2 - a^2*d^2, 0] && Not[IntegerQ[n/2]] && (IntegerQ[p] || GtQ[c, 0]) && IntegerQ[m]
Int[x_^m_*(c_ + d_./x_)^p_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := -c^p*x^m*(1/x)^m* Subst[Int[(1 + d*x/c)^ p*(1 + x/a)^(n/2)/(x^(m + 2)*(1 - x/a)^(n/2)), x], x, 1/x] /; FreeQ[{a, c, d, m, n, p}, x] && EqQ[c^2 - a^2*d^2, 0] && Not[IntegerQ[n/2]] && (IntegerQ[p] || GtQ[c, 0]) && Not[IntegerQ[m]]
Int[u_.*(c_ + d_./x_)^p_*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := (c + d/x)^p/(1 + d/(c*x))^p* Int[u*(1 + d/(c*x))^p*E^(n*ArcCoth[a*x]), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[c^2 - a^2*d^2, 0] && Not[IntegerQ[n/2]] && Not[IntegerQ[p] || GtQ[c, 0]]
Int[E^(n_.*ArcCoth[a_.*x_])/(c_ + d_.*x_^2), x_Symbol] := E^(n*ArcCoth[a*x])/(a*c*n) /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[n/2]]
Int[E^(n_*ArcCoth[a_.*x_])/(c_ + d_.*x_^2)^(3/2), x_Symbol] := (n - a*x)* E^(n*ArcCoth[a*x])/(a*c*(n^2 - 1)*Sqrt[c + d*x^2]) /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[n]]
Int[(c_ + d_.*x_^2)^p_*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := (n + 2*a*(p + 1)*x)*(c + d*x^2)^(p + 1)* E^(n*ArcCoth[a*x])/(a*c*(n^2 - 4*(p + 1)^2)) - 2*(p + 1)*(2*p + 3)/(c*(n^2 - 4*(p + 1)^2))* Int[(c + d*x^2)^(p + 1)*E^(n*ArcCoth[a*x]), x] /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[n/2]] && LtQ[p, -1] && NeQ[p, -3/2] && NeQ[n^2 - 4*(p + 1)^2, 0] && (IntegerQ[p] || Not[IntegerQ[n]])
Int[x_*E^(n_*ArcCoth[a_.*x_])/(c_ + d_.*x_^2)^(3/2), x_Symbol] := -(1 - a*n*x)* E^(n*ArcCoth[a*x])/(a^2*c*(n^2 - 1)*Sqrt[c + d*x^2]) /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[n]]
Int[x_*(c_ + d_.*x_^2)^p_*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := (2*(p + 1) + a*n*x)*(c + d*x^2)^(p + 1)* E^(n*ArcCoth[a*x])/(a^2*c*(n^2 - 4*(p + 1)^2)) - n*(2*p + 3)/(a*c*(n^2 - 4*(p + 1)^2))* Int[(c + d*x^2)^(p + 1)*E^(n*ArcCoth[a*x]), x] /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[n/2]] && LeQ[p, -1] && NeQ[p, -3/2] && NeQ[n^2 - 4*(p + 1)^2, 0] && (IntegerQ[p] || Not[IntegerQ[n]])
Int[x_^2*(c_ + d_.*x_^2)^p_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := -(n + 2*(p + 1)*a*x)*(c + d*x^2)^(p + 1)* E^(n*ArcCoth[a*x])/(a^3*c*n^2*(n^2 - 1)) /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[n/2]] && EqQ[n^2 + 2*(p + 1), 0] && NeQ[n^2, 1]
Int[x_^2*(c_ + d_.*x_^2)^p_*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := (n + 2*(p + 1)*a*x)*(c + d*x^2)^(p + 1)* E^(n*ArcCoth[a*x])/(a^3*c*(n^2 - 4*(p + 1)^2)) - (n^2 + 2*(p + 1))/(a^2*c*(n^2 - 4*(p + 1)^2))* Int[(c + d*x^2)^(p + 1)*E^(n*ArcCoth[a*x]), x] /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[n/2]] && LeQ[p, -1] && NeQ[n^2 + 2*(p + 1), 0] && NeQ[n^2 - 4*(p + 1)^2, 0] && (IntegerQ[p] || Not[IntegerQ[n]])
Int[x_^m_.*(c_ + d_.*x_^2)^p_*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := -(-c)^p/a^(m + 1)* Subst[Int[E^(n*x)*Coth[x]^(m + 2*(p + 1))/Cosh[x]^(2*(p + 1)), x], x, ArcCoth[a*x]] /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[n/2]] && IntegerQ[m] && LeQ[3, m, -2 (p + 1)] && IntegerQ[p]
Int[u_.*(c_ + d_.*x_^2)^p_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := d^p*Int[u*x^(2*p)*(1 - 1/(a^2*x^2))^p*E^(n*ArcCoth[a*x]), x] /; FreeQ[{a, c, d, n}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[n/2]] && IntegerQ[p]
Int[u_.*(c_ + d_.*x_^2)^p_*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := (c + d*x^2)^p/(x^(2*p)*(1 - 1/(a^2*x^2))^p)* Int[u*x^(2*p)*(1 - 1/(a^2*x^2))^p*E^(n*ArcCoth[a*x]), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[a^2*c + d, 0] && Not[IntegerQ[n/2]] && Not[IntegerQ[p]]
Int[u_.*(c_ + d_./x_^2)^p_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := c^p/a^(2*p)* Int[u/x^(2*p)*(-1 + a*x)^(p - n/2)*(1 + a*x)^(p + n/2), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[c + a^2*d, 0] && Not[IntegerQ[n/2]] && (IntegerQ[p] || GtQ[c, 0]) && IntegersQ[2*p, p + n/2]
Int[(c_ + d_./x_^2)^p_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := -c^p* Subst[Int[(1 - x/a)^(p - n/2)*(1 + x/a)^(p + n/2)/x^2, x], x, 1/x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[c + a^2*d, 0] && Not[IntegerQ[n/2]] && (IntegerQ[p] || GtQ[c, 0]) && Not[IntegersQ[2*p, p + n/2]]
Int[x_^m_.*(c_ + d_./x_^2)^p_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := -c^p* Subst[Int[(1 - x/a)^(p - n/2)*(1 + x/a)^(p + n/2)/x^(m + 2), x], x, 1/x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[c + a^2*d, 0] && Not[IntegerQ[n/2]] && (IntegerQ[p] || GtQ[c, 0]) && Not[IntegersQ[2*p, p + n/2]] && IntegerQ[m]
Int[x_^m_*(c_ + d_./x_^2)^p_.*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := -c^p*x^m*(1/x)^m* Subst[Int[(1 - x/a)^(p - n/2)*(1 + x/a)^(p + n/2)/x^(m + 2), x], x, 1/x] /; FreeQ[{a, c, d, m, n, p}, x] && EqQ[c + a^2*d, 0] && Not[IntegerQ[n/2]] && (IntegerQ[p] || GtQ[c, 0]) && Not[IntegersQ[2*p, p + n/2]] && Not[IntegerQ[m]]
Int[u_.*(c_ + d_./x_^2)^p_*E^(n_.*ArcCoth[a_.*x_]), x_Symbol] := c^IntPart[p]*(c + d/x^2)^FracPart[p]/(1 - 1/(a^2*x^2))^FracPart[p]* Int[u*(1 - 1/(a^2*x^2))^p*E^(n*ArcCoth[a*x]), x] /; FreeQ[{a, c, d, n, p}, x] && EqQ[c + a^2*d, 0] && Not[IntegerQ[n/2]] && Not[IntegerQ[p] || GtQ[c, 0]]
Int[u_.*E^(n_*ArcCoth[c_.*(a_ + b_.*x_)]), x_Symbol] := (-1)^(n/2)*Int[u*E^(n*ArcTanh[c*(a + b*x)]), x] /; FreeQ[{a, b, c}, x] && IntegerQ[n/2]
Int[E^(n_.*ArcCoth[c_.*(a_ + b_.*x_)]), x_Symbol] := (c*(a + b*x))^(n/ 2)*(1 + 1/(c*(a + b*x)))^(n/2)/(1 + a*c + b*c*x)^(n/2)* Int[(1 + a*c + b*c*x)^(n/2)/(-1 + a*c + b*c*x)^(n/2), x] /; FreeQ[{a, b, c, n}, x] && Not[IntegerQ[n/2]]
Int[x_^m_*E^(n_*ArcCoth[c_.*(a_ + b_.*x_)]), x_Symbol] := -4/(n*b^(m + 1)*c^(m + 1))* Subst[ Int[x^(2/n)*(1 + a*c + (1 - a*c)*x^(2/n))^ m/(-1 + x^(2/n))^(m + 2), x], x, (1 + 1/(c*(a + b*x)))^(n/2)/(1 - 1/(c*(a + b*x)))^(n/2)] /; FreeQ[{a, b, c}, x] && ILtQ[m, 0] && LtQ[-1, n, 1]
Int[(d_. + e_.*x_)^m_.*E^(n_.*ArcCoth[c_.*(a_ + b_.*x_)]), x_Symbol] := (c*(a + b*x))^(n/ 2)*(1 + 1/(c*(a + b*x)))^(n/2)/(1 + a*c + b*c*x)^(n/2)* Int[(d + e*x)^m*(1 + a*c + b*c*x)^(n/2)/(-1 + a*c + b*c*x)^(n/2), x] /; FreeQ[{a, b, c, d, e, m, n}, x] && Not[IntegerQ[n/2]]
Int[u_.*(c_ + d_.*x_ + e_.*x_^2)^p_.*E^(n_.*ArcCoth[a_ + b_.*x_]), x_Symbol] := (c/(1 - a^2))^ p*((a + b*x)/(1 + a + b*x))^(n/2)*((1 + a + b*x)/(a + b*x))^(n/ 2)*((1 - a - b*x)^(n/2)/(-1 + a + b*x)^(n/2))* Int[u*(1 - a - b*x)^(p - n/2)*(1 + a + b*x)^(p + n/2), x] /; FreeQ[{a, b, c, d, e, n, p}, x] && Not[IntegerQ[n/2]] && EqQ[b*d - 2*a*e, 0] && EqQ[b^2*c + e (1 - a^2), 0] && (IntegerQ[p] || GtQ[c/(1 - a^2), 0])
Int[u_.*(c_ + d_.*x_ + e_.*x_^2)^p_.*E^(n_.*ArcCoth[a_ + b_.*x_]), x_Symbol] := (c + d*x + e*x^2)^p/(1 - a^2 - 2*a*b*x - b^2*x^2)^p* Int[u*(1 - a^2 - 2*a*b*x - b^2*x^2)^p*E^(n*ArcCoth[a*x]), x] /; FreeQ[{a, b, c, d, e, n, p}, x] && Not[IntegerQ[n/2]] && EqQ[b*d - 2*a*e, 0] && EqQ[b^2*c + e (1 - a^2), 0] && Not[IntegerQ[p] || GtQ[c/(1 - a^2), 0]]
Int[u_.*E^(n_.*ArcCoth[c_./(a_. + b_.*x_)]), x_Symbol] := Int[u*E^(n*ArcTanh[a/c + b*x/c]), x] /; FreeQ[{a, b, c, n}, x]
