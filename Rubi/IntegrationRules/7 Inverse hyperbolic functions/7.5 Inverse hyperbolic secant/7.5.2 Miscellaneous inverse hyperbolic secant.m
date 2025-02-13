
(* ::Subsection::Closed:: *)
(* 7.5.2 Miscellaneous inverse hyperbolic secant *)
Int[ArcSech[c_ + d_.*x_], x_Symbol] := (c + d*x)*ArcSech[c + d*x]/d + Int[Sqrt[(1 - c - d*x)/(1 + c + d*x)]/(1 - c - d*x), x] /; FreeQ[{c, d}, x]
Int[ArcCsch[c_ + d_.*x_], x_Symbol] := (c + d*x)*ArcCsch[c + d*x]/d + Int[1/((c + d*x)*Sqrt[1 + 1/(c + d*x)^2]), x] /; FreeQ[{c, d}, x]
Int[(a_. + b_.*ArcSech[c_ + d_.*x_])^p_., x_Symbol] := 1/d*Subst[Int[(a + b*ArcSech[x])^p, x], x, c + d*x] /; FreeQ[{a, b, c, d}, x] && IGtQ[p, 0]
Int[(a_. + b_.*ArcCsch[c_ + d_.*x_])^p_., x_Symbol] := 1/d*Subst[Int[(a + b*ArcCsch[x])^p, x], x, c + d*x] /; FreeQ[{a, b, c, d}, x] && IGtQ[p, 0]
Int[(a_. + b_.*ArcSech[c_ + d_.*x_])^p_, x_Symbol] := Unintegrable[(a + b*ArcSech[c + d*x])^p, x] /; FreeQ[{a, b, c, d, p}, x] && Not[IGtQ[p, 0]]
Int[(a_. + b_.*ArcCsch[c_ + d_.*x_])^p_, x_Symbol] := Unintegrable[(a + b*ArcCsch[c + d*x])^p, x] /; FreeQ[{a, b, c, d, p}, x] && Not[IGtQ[p, 0]]
Int[(e_. + f_.*x_)^m_.*(a_. + b_.*ArcSech[c_ + d_.*x_])^p_., x_Symbol] := 1/d*Subst[Int[(f*x/d)^m*(a + b*ArcSech[x])^p, x], x, c + d*x] /; FreeQ[{a, b, c, d, e, f, m}, x] && EqQ[d*e - c*f, 0] && IGtQ[p, 0]
Int[(e_. + f_.*x_)^m_.*(a_. + b_.*ArcCsch[c_ + d_.*x_])^p_., x_Symbol] := 1/d*Subst[Int[(f*x/d)^m*(a + b*ArcCsch[x])^p, x], x, c + d*x] /; FreeQ[{a, b, c, d, e, f, m}, x] && EqQ[d*e - c*f, 0] && IGtQ[p, 0]
(* Int[x_^m_.*ArcSech[a_+b_.*x_],x_Symbol] := -((-a)^(m+1)-b^(m+1)*x^(m+1))*ArcSech[a+b*x]/(b^(m+1)*(m+1)) + 1/(b^(m+1)*(m+1))*Subst[Int[((-a*x)^(m+1)-(1-a*x)^(m+1))/(x^(m+1)* Sqrt[-1+x]*Sqrt[1+x]),x],x,1/(a+b*x)] /; FreeQ[{a,b},x] && IntegerQ[m] && NeQ[m,-1] *)
(* Int[x_^m_.*ArcCsch[a_+b_.*x_],x_Symbol] := -((-a)^(m+1)-b^(m+1)*x^(m+1))*ArcCsch[a+b*x]/(b^(m+1)*(m+1)) + 1/(b^(m+1)*(m+1))*Subst[Int[((-a*x)^(m+1)-(1-a*x)^(m+1))/(x^(m+1)* Sqrt[1+x^2]),x],x,1/(a+b*x)] /; FreeQ[{a,b},x] && IntegerQ[m] && NeQ[m,-1] *)
Int[(e_. + f_.*x_)^m_.*(a_. + b_.*ArcSech[c_ + d_.*x_])^p_., x_Symbol] := -1/d^(m + 1)* Subst[Int[(a + b*x)^p*Sech[x]*Tanh[x]*(d*e - c*f + f*Sech[x])^m, x], x, ArcSech[c + d*x]] /; FreeQ[{a, b, c, d, e, f}, x] && IGtQ[p, 0] && IntegerQ[m]
Int[(e_. + f_.*x_)^m_.*(a_. + b_.*ArcCsch[c_ + d_.*x_])^p_., x_Symbol] := -1/d^(m + 1)* Subst[Int[(a + b*x)^p*Csch[x]*Coth[x]*(d*e - c*f + f*Csch[x])^m, x], x, ArcCsch[c + d*x]] /; FreeQ[{a, b, c, d, e, f}, x] && IGtQ[p, 0] && IntegerQ[m]
Int[(e_. + f_.*x_)^m_.*(a_. + b_.*ArcSech[c_ + d_.*x_])^p_., x_Symbol] := 1/d*Subst[Int[((d*e - c*f)/d + f*x/d)^m*(a + b*ArcSech[x])^p, x], x, c + d*x] /; FreeQ[{a, b, c, d, e, f, m}, x] && IGtQ[p, 0]
Int[(e_. + f_.*x_)^m_.*(a_. + b_.*ArcCsch[c_ + d_.*x_])^p_., x_Symbol] := 1/d*Subst[Int[((d*e - c*f)/d + f*x/d)^m*(a + b*ArcCsch[x])^p, x], x, c + d*x] /; FreeQ[{a, b, c, d, e, f, m}, x] && IGtQ[p, 0]
Int[(e_. + f_.*x_)^m_.*(a_. + b_.*ArcSech[c_ + d_.*x_])^p_, x_Symbol] := Unintegrable[(e + f*x)^m*(a + b*ArcSech[c + d*x])^p, x] /; FreeQ[{a, b, c, d, e, f, m, p}, x] && Not[IGtQ[p, 0]]
Int[(e_. + f_.*x_)^m_.*(a_. + b_.*ArcCsch[c_ + d_.*x_])^p_, x_Symbol] := Unintegrable[(e + f*x)^m*(a + b*ArcCsch[c + d*x])^p, x] /; FreeQ[{a, b, c, d, e, f, m, p}, x] && Not[IGtQ[p, 0]]
Int[u_.*ArcSech[c_./(a_. + b_.*x_^n_.)]^m_., x_Symbol] := Int[u*ArcCosh[a/c + b*x^n/c]^m, x] /; FreeQ[{a, b, c, n, m}, x]
Int[u_.*ArcCsch[c_./(a_. + b_.*x_^n_.)]^m_., x_Symbol] := Int[u*ArcSinh[a/c + b*x^n/c]^m, x] /; FreeQ[{a, b, c, n, m}, x]
Int[E^ArcSech[a_.*x_], x_Symbol] := x*E^ArcSech[a*x] + Log[x]/a + 1/a*Int[1/(x*(1 - a*x))*Sqrt[(1 - a*x)/(1 + a*x)], x] /; FreeQ[a, x]
Int[E^ArcSech[a_.*x_^p_], x_Symbol] := x*E^ArcSech[a*x^p] + p/a*Int[1/x^p, x] + p*Sqrt[1 + a*x^p]/a*Sqrt[1/(1 + a*x^p)]* Int[1/(x^p*Sqrt[1 + a*x^p]*Sqrt[1 - a*x^p]), x] /; FreeQ[{a, p}, x]
Int[E^ArcCsch[a_.*x_^p_.], x_Symbol] := 1/a*Int[1/x^p, x] + Int[Sqrt[1 + 1/(a^2*x^(2*p))], x] /; FreeQ[{a, p}, x]
Int[E^(n_.*ArcSech[u_]), x_Symbol] := Int[(1/u + Sqrt[(1 - u)/(1 + u)] + 1/u*Sqrt[(1 - u)/(1 + u)])^n, x] /; IntegerQ[n]
Int[E^(n_.*ArcCsch[u_]), x_Symbol] := Int[(1/u + Sqrt[1 + 1/u^2])^n, x] /; IntegerQ[n]
Int[E^ArcSech[a_.*x_^p_.]/x_, x_Symbol] := -1/(a*p*x^p) + Sqrt[1 + a*x^p]/a*Sqrt[1/(1 + a*x^p)]* Int[Sqrt[1 + a*x^p]*Sqrt[1 - a*x^p]/x^(p + 1), x] /; FreeQ[{a, p}, x]
Int[x_^m_.*E^ArcSech[a_.*x_^p_.], x_Symbol] := x^(m + 1)*E^ArcSech[a*x^p]/(m + 1) + p/(a*(m + 1))*Int[x^(m - p), x] + p*Sqrt[1 + a*x^p]/(a*(m + 1))*Sqrt[1/(1 + a*x^p)]* Int[x^(m - p)/(Sqrt[1 + a*x^p]*Sqrt[1 - a*x^p]), x] /; FreeQ[{a, m, p}, x] && NeQ[m, -1]
Int[x_^m_.*E^ArcCsch[a_.*x_^p_.], x_Symbol] := 1/a*Int[x^(m - p), x] + Int[x^m*Sqrt[1 + 1/(a^2*x^(2*p))], x] /; FreeQ[{a, m, p}, x]
Int[x_^m_.*E^(n_.*ArcSech[u_]), x_Symbol] := Int[x^m*(1/u + Sqrt[(1 - u)/(1 + u)] + 1/u*Sqrt[(1 - u)/(1 + u)])^ n, x] /; FreeQ[m, x] && IntegerQ[n]
Int[x_^m_.*E^(n_.*ArcCsch[u_]), x_Symbol] := Int[x^m*(1/u + Sqrt[1 + 1/u^2])^n, x] /; FreeQ[m, x] && IntegerQ[n]
Int[E^(ArcSech[c_.*x_])/(a_ + b_.*x_^2), x_Symbol] := 1/(a*c)*Int[Sqrt[1/(1 + c*x)]/(x*Sqrt[1 - c*x]), x] + 1/c*Int[1/(x*(a + b*x^2)), x] /; FreeQ[{a, b, c}, x] && EqQ[b + a*c^2, 0]
Int[E^(ArcCsch[c_.*x_])/(a_ + b_.*x_^2), x_Symbol] := 1/(a*c^2)*Int[1/(x^2*Sqrt[1 + 1/(c^2*x^2)]), x] + 1/c*Int[1/(x*(a + b*x^2)), x] /; FreeQ[{a, b, c}, x] && EqQ[b - a*c^2, 0]
Int[(d_.*x_)^m_.*E^(ArcSech[c_.*x_])/(a_ + b_.*x_^2), x_Symbol] := d/(a*c)*Int[(d*x)^(m - 1)*Sqrt[1/(1 + c*x)]/Sqrt[1 - c*x], x] + d/c*Int[(d*x)^(m - 1)/(a + b*x^2), x] /; FreeQ[{a, b, c, d, m}, x] && EqQ[b + a*c^2, 0]
Int[(d_.*x_)^m_.*E^(ArcCsch[c_.*x_])/(a_ + b_.*x_^2), x_Symbol] := d^2/(a*c^2)*Int[(d*x)^(m - 2)/Sqrt[1 + 1/(c^2*x^2)], x] + d/c*Int[(d*x)^(m - 1)/(a + b*x^2), x] /; FreeQ[{a, b, c, d, m}, x] && EqQ[b - a*c^2, 0]
Int[ArcSech[u_], x_Symbol] := x*ArcSech[u] + Sqrt[1 - u^2]/(u*Sqrt[-1 + 1/u]*Sqrt[1 + 1/u])* Int[SimplifyIntegrand[x*D[u, x]/(u*Sqrt[1 - u^2]), x], x] /; InverseFunctionFreeQ[u, x] && Not[FunctionOfExponentialQ[u, x]]
Int[ArcCsch[u_], x_Symbol] := x*ArcCsch[u] - u/Sqrt[-u^2]* Int[SimplifyIntegrand[x*D[u, x]/(u*Sqrt[-1 - u^2]), x], x] /; InverseFunctionFreeQ[u, x] && Not[FunctionOfExponentialQ[u, x]]
Int[(c_. + d_.*x_)^m_.*(a_. + b_.*ArcSech[u_]), x_Symbol] := (c + d*x)^(m + 1)*(a + b*ArcSech[u])/(d*(m + 1)) + b*Sqrt[1 - u^2]/(d*(m + 1)*u*Sqrt[-1 + 1/u]*Sqrt[1 + 1/u])* Int[SimplifyIntegrand[(c + d*x)^(m + 1)*D[u, x]/(u*Sqrt[1 - u^2]), x], x] /; FreeQ[{a, b, c, d, m}, x] && NeQ[m, -1] && InverseFunctionFreeQ[u, x] && Not[FunctionOfQ[(c + d*x)^(m + 1), u, x]] && Not[FunctionOfExponentialQ[u, x]]
Int[(c_. + d_.*x_)^m_.*(a_. + b_.*ArcCsch[u_]), x_Symbol] := (c + d*x)^(m + 1)*(a + b*ArcCsch[u])/(d*(m + 1)) - b*u/(d*(m + 1)*Sqrt[-u^2])* Int[SimplifyIntegrand[(c + d*x)^(m + 1)* D[u, x]/(u*Sqrt[-1 - u^2]), x], x] /; FreeQ[{a, b, c, d, m}, x] && NeQ[m, -1] && InverseFunctionFreeQ[u, x] && Not[FunctionOfQ[(c + d*x)^(m + 1), u, x]] && Not[FunctionOfExponentialQ[u, x]]
Int[v_*(a_. + b_.*ArcSech[u_]), x_Symbol] := With[{w = IntHide[v, x]}, Dist[(a + b*ArcSech[u]), w, x] + b*Sqrt[1 - u^2]/(u*Sqrt[-1 + 1/u]*Sqrt[1 + 1/u])* Int[SimplifyIntegrand[w*D[u, x]/(u*Sqrt[1 - u^2]), x], x] /; InverseFunctionFreeQ[w, x]] /; FreeQ[{a, b}, x] && InverseFunctionFreeQ[u, x] && Not[MatchQ[v, (c_. + d_.*x)^m_. /; FreeQ[{c, d, m}, x]]]
Int[v_*(a_. + b_.*ArcCsch[u_]), x_Symbol] := With[{w = IntHide[v, x]}, Dist[(a + b*ArcCsch[u]), w, x] - b*u/Sqrt[-u^2]* Int[SimplifyIntegrand[w*D[u, x]/(u*Sqrt[-1 - u^2]), x], x] /; InverseFunctionFreeQ[w, x]] /; FreeQ[{a, b}, x] && InverseFunctionFreeQ[u, x] && Not[MatchQ[v, (c_. + d_.*x)^m_. /; FreeQ[{c, d, m}, x]]]
