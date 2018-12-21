
(* ::Subsection::Closed:: *)
(* 7.1.5 u (a+b arcsinh(c x))^n *)
Int[(a_. + b_.*ArcSinh[c_.*x_])^n_./(d_. + e_.*x_), x_Symbol] := Subst[Int[(a + b*x)^n*Cosh[x]/(c*d + e*Sinh[x]), x], x, ArcSinh[c*x]] /; FreeQ[{a, b, c, d, e}, x] && IGtQ[n, 0]
Int[(d_. + e_.*x_)^m_.*(a_. + b_.*ArcSinh[c_.*x_])^n_., x_Symbol] := (d + e*x)^(m + 1)*(a + b*ArcSinh[c*x])^ n/(e*(m + 1)) - b*c*n/(e*(m + 1))* Int[(d + e*x)^(m + 1)*(a + b*ArcSinh[c*x])^(n - 1)/ Sqrt[1 + c^2*x^2], x] /; FreeQ[{a, b, c, d, e, m}, x] && IGtQ[n, 0] && NeQ[m, -1]
Int[(d_ + e_.*x_)^m_.*(a_. + b_.*ArcSinh[c_.*x_])^n_, x_Symbol] := Int[ExpandIntegrand[(d + e*x)^m*(a + b*ArcSinh[c*x])^n, x], x] /; FreeQ[{a, b, c, d, e}, x] && IGtQ[m, 0] && LtQ[n, -1]
Int[(d_. + e_.*x_)^m_.*(a_. + b_.*ArcSinh[c_.*x_])^n_., x_Symbol] := 1/c^(m + 1)* Subst[Int[(a + b*x)^n*Cosh[x]*(c*d + e*Sinh[x])^m, x], x, ArcSinh[c*x]] /; FreeQ[{a, b, c, d, e, n}, x] && IGtQ[m, 0]
Int[Px_*(a_. + b_.*ArcSinh[c_.*x_]), x_Symbol] := With[{u = IntHide[ExpandExpression[Px, x], x]}, Dist[a + b*ArcSinh[c*x], u, x] - b*c*Int[SimplifyIntegrand[u/Sqrt[1 + c^2*x^2], x], x]] /; FreeQ[{a, b, c}, x] && PolynomialQ[Px, x]
(* Int[Px_*(a_.+b_.*ArcSinh[c_.*x_])^n_.,x_Symbol] :=  With[{u=IntHide[Px,x]}, Dist[(a+b*ArcSinh[c*x])^n,u,x] -  b*c*n*Int[SimplifyIntegrand[u*(a+b*ArcSinh[c*x])^(n-1)/Sqrt[1+c^2*x^2] ,x],x]] /; FreeQ[{a,b,c},x] && PolynomialQ[Px,x] && IGtQ[n,0] *)
Int[Px_*(a_. + b_.*ArcSinh[c_.*x_])^n_, x_Symbol] := Int[ExpandIntegrand[Px*(a + b*ArcSinh[c*x])^n, x], x] /; FreeQ[{a, b, c, n}, x] && PolynomialQ[Px, x]
Int[Px_*(d_. + e_.*x_)^m_.*(a_. + b_.*ArcSinh[c_.*x_]), x_Symbol] := With[{u = IntHide[Px*(d + e*x)^m, x]}, Dist[a + b*ArcSinh[c*x], u, x] - b*c*Int[SimplifyIntegrand[u/Sqrt[1 + c^2*x^2], x], x]] /; FreeQ[{a, b, c, d, e, m}, x] && PolynomialQ[Px, x]
Int[(f_. + g_.*x_)^p_.*(d_ + e_.*x_)^m_*(a_. + b_.*ArcSinh[c_.*x_])^ n_, x_Symbol] := With[{u = IntHide[(f + g*x)^p*(d + e*x)^m, x]}, Dist[(a + b*ArcSinh[c*x])^n, u, x] - b*c*n*Int[ SimplifyIntegrand[ u*(a + b*ArcSinh[c*x])^(n - 1)/Sqrt[1 + c^2*x^2], x], x]] /; FreeQ[{a, b, c, d, e, f, g}, x] && IGtQ[n, 0] && IGtQ[p, 0] && ILtQ[m, 0] && LtQ[m + p + 1, 0]
Int[(f_. + g_.*x_ + h_.*x_^2)^ p_.*(a_. + b_.*ArcSinh[c_.*x_])^n_/(d_ + e_.*x_)^2, x_Symbol] := With[{u = IntHide[(f + g*x + h*x^2)^p/(d + e*x)^2, x]}, Dist[(a + b*ArcSinh[c*x])^n, u, x] - b*c*n*Int[ SimplifyIntegrand[ u*(a + b*ArcSinh[c*x])^(n - 1)/Sqrt[1 + c^2*x^2], x], x]] /; FreeQ[{a, b, c, d, e, f, g, h}, x] && IGtQ[n, 0] && IGtQ[p, 0] && EqQ[e*g - 2*d*h, 0]
Int[Px_*(d_ + e_.*x_)^m_.*(a_. + b_.*ArcSinh[c_.*x_])^n_., x_Symbol] := Int[ExpandIntegrand[Px*(d + e*x)^m*(a + b*ArcSinh[c*x])^n, x], x] /; FreeQ[{a, b, c, d, e}, x] && PolynomialQ[Px, x] && IGtQ[n, 0] && IntegerQ[m]
Int[(f_ + g_.*x_)^m_.*(d_ + e_.*x_^2)^p_*(a_. + b_.*ArcSinh[c_.*x_]), x_Symbol] := With[{u = IntHide[(f + g*x)^m*(d + e*x^2)^p, x]}, Dist[a + b*ArcSinh[c*x], u, x] - b*c*Int[Dist[1/Sqrt[1 + c^2*x^2], u, x], x]] /; FreeQ[{a, b, c, d, e, f, g}, x] && EqQ[e, c^2*d] && IGtQ[m, 0] && ILtQ[p + 1/2, 0] && GtQ[d, 0] && (LtQ[m, -2*p - 1] || GtQ[m, 3])
Int[(f_ + g_.*x_)^m_.*(d_ + e_.*x_^2)^p_*(a_. + b_.*ArcSinh[c_.*x_])^ n_., x_Symbol] := Int[ExpandIntegrand[(d + e*x^2)^p*(a + b*ArcSinh[c*x])^n, (f + g*x)^ m, x], x] /; FreeQ[{a, b, c, d, e, f, g}, x] && EqQ[e, c^2*d] && IGtQ[m, 0] && IntegerQ[p + 1/2] && GtQ[d, 0] && IGtQ[n, 0] && (EqQ[n, 1] && GtQ[p, -1] || GtQ[p, 0] || EqQ[m, 1] || EqQ[m, 2] && LtQ[p, -2])
Int[(f_. + g_.*x_)^m_* Sqrt[d_ + e_.*x_^2]*(a_. + b_.*ArcSinh[c_.*x_])^n_., x_Symbol] := (f + g*x)^ m*(d + e*x^2)*(a + b*ArcSinh[c*x])^(n + 1)/(b*c* Sqrt[d]*(n + 1)) - 1/(b*c*Sqrt[d]*(n + 1))* Int[(d*g*m + 2*e*f*x + e*g*(m + 2)*x^2)*(f + g*x)^(m - 1)*(a + b*ArcSinh[c*x])^(n + 1), x] /; FreeQ[{a, b, c, d, e, f, g}, x] && EqQ[e, c^2*d] && ILtQ[m, 0] && GtQ[d, 0] && IGtQ[n, 0]
Int[(f_ + g_.*x_)^m_.*(d_ + e_.*x_^2)^p_*(a_. + b_.*ArcSinh[c_.*x_])^ n_., x_Symbol] := Int[ExpandIntegrand[ Sqrt[d + e*x^2]*(a + b*ArcSinh[c*x])^n, (f + g*x)^ m*(d + e*x^2)^(p - 1/2), x], x] /; FreeQ[{a, b, c, d, e, f, g}, x] && EqQ[e, c^2*d] && IntegerQ[m] && IGtQ[p + 1/2, 0] && GtQ[d, 0] && IGtQ[n, 0]
Int[(f_ + g_.*x_)^m_.*(d_ + e_.*x_^2)^p_*(a_. + b_.*ArcSinh[c_.*x_])^ n_., x_Symbol] := (f + g*x)^ m*(d + e*x^2)^(p + 1/2)*(a + b*ArcSinh[c*x])^(n + 1)/(b*c* Sqrt[d]*(n + 1)) - 1/(b*c*Sqrt[d]*(n + 1))* Int[ ExpandIntegrand[(f + g*x)^(m - 1)*(a + b*ArcSinh[c*x])^(n + 1), (d*g*m + e*f*(2*p + 1)*x + e*g*(m + 2*p + 1)*x^2)*(d + e*x^2)^(p - 1/2), x], x] /; FreeQ[{a, b, c, d, e, f, g}, x] && EqQ[e, c^2*d] && ILtQ[m, 0] && IGtQ[p - 1/2, 0] && GtQ[d, 0] && IGtQ[n, 0]
Int[(f_ + g_.*x_)^m_.*(a_. + b_.*ArcSinh[c_.*x_])^n_/ Sqrt[d_ + e_.*x_^2], x_Symbol] := (f + g*x)^ m*(a + b*ArcSinh[c*x])^(n + 1)/(b*c*Sqrt[d]*(n + 1)) - g*m/(b*c*Sqrt[d]*(n + 1))* Int[(f + g*x)^(m - 1)*(a + b*ArcSinh[c*x])^(n + 1), x] /; FreeQ[{a, b, c, d, e, f, g}, x] && EqQ[e, c^2*d] && IGtQ[m, 0] && GtQ[d, 0] && LtQ[n, -1]
Int[(f_ + g_.*x_)^m_.*(a_. + b_.*ArcSinh[c_.*x_])^n_./ Sqrt[d_ + e_.*x_^2], x_Symbol] := 1/(c^(m + 1)*Sqrt[d])* Subst[Int[(a + b*x)^n*(c*f + g*Sinh[x])^m, x], x, ArcSinh[c*x]] /; FreeQ[{a, b, c, d, e, f, g, n}, x] && EqQ[e, c^2*d] && IntegerQ[m] && GtQ[d, 0] && (GtQ[m, 0] || IGtQ[n, 0])
Int[(f_ + g_.*x_)^m_.*(d_ + e_.*x_^2)^p_*(a_. + b_.*ArcSinh[c_.*x_])^ n_., x_Symbol] := Int[ExpandIntegrand[(a + b*ArcSinh[c*x])^n/ Sqrt[d + e*x^2], (f + g*x)^m*(d + e*x^2)^(p + 1/2), x], x] /; FreeQ[{a, b, c, d, e, f, g}, x] && EqQ[e, c^2*d] && IntegerQ[m] && ILtQ[p + 1/2, 0] && GtQ[d, 0] && IGtQ[n, 0]
Int[(f_ + g_.*x_)^m_.*(d_ + e_.*x_^2)^p_*(a_. + b_.*ArcSinh[c_.*x_])^ n_., x_Symbol] := Simp[(d + e*x^2)^p/(1 + c^2*x^2)^p]* Int[(f + g*x)^m*(1 + c^2*x^2)^p*(a + b*ArcSinh[c*x])^n, x] /; FreeQ[{a, b, c, d, e, f, g, n}, x] && EqQ[e, c^2*d] && IntegerQ[m] && IntegerQ[p - 1/2] && Not[GtQ[d, 0]]
Int[Log[h_.*(f_. + g_.*x_)^m_.]*(a_. + b_.*ArcSinh[c_.*x_])^n_./ Sqrt[d_ + e_.*x_^2], x_Symbol] := Log[h*(f + g*x)^m]*(a + b*ArcSinh[c*x])^(n + 1)/(b*c* Sqrt[d]*(n + 1)) - g*m/(b*c*Sqrt[d]*(n + 1))* Int[(a + b*ArcSinh[c*x])^(n + 1)/(f + g*x), x] /; FreeQ[{a, b, c, d, e, f, g, h, m}, x] && EqQ[e, c^2*d] && GtQ[d, 0] && IGtQ[n, 0]
Int[Log[h_.*(f_. + g_.*x_)^m_.]*(d_ + e_.*x_^2)^ p_*(a_. + b_.*ArcSinh[c_.*x_])^n_., x_Symbol] := Simp[(d + e*x^2)^p/(1 + c^2*x^2)^p]* Int[Log[h*(f + g*x)^m]*(1 + c^2*x^2)^p*(a + b*ArcSinh[c*x])^n, x] /; FreeQ[{a, b, c, d, e, f, g, h, m, n}, x] && EqQ[e, c^2*d] && IntegerQ[p - 1/2] && Not[GtQ[d, 0]]
Int[(d_ + e_.*x_)^m_*(f_ + g_.*x_)^m_*(a_. + b_.*ArcSinh[c_.*x_]), x_Symbol] := With[{u = IntHide[(d + e*x)^m*(f + g*x)^m, x]}, Dist[a + b*ArcSinh[c*x], u, x] - b*c*Int[Dist[1/Sqrt[1 + c^2*x^2], u, x], x]] /; FreeQ[{a, b, c, d, e, f, g}, x] && ILtQ[m + 1/2, 0]
Int[(d_ + e_.*x_)^m_.*(f_ + g_.*x_)^m_.*(a_. + b_.*ArcSinh[c_.*x_])^ n_., x_Symbol] := Int[ExpandIntegrand[(a + b*ArcSinh[c*x])^n, (d + e*x)^m*(f + g*x)^m, x], x] /; FreeQ[{a, b, c, d, e, f, g, n}, x] && IntegerQ[m]
Int[u_*(a_. + b_.*ArcSinh[c_.*x_]), x_Symbol] := With[{v = IntHide[u, x]}, Dist[a + b*ArcSinh[c*x], v, x] - b*c*Int[SimplifyIntegrand[v/Sqrt[1 + c^2*x^2], x], x] /; InverseFunctionFreeQ[v, x]] /; FreeQ[{a, b, c}, x]
Int[Px_*(d_ + e_.*x_^2)^p_*(a_. + b_.*ArcSinh[c_.*x_])^n_, x_Symbol] := With[{u = ExpandIntegrand[Px*(d + e*x^2)^p*(a + b*ArcSinh[c*x])^n, x]}, Int[u, x] /; SumQ[u]] /; FreeQ[{a, b, c, d, e, n}, x] && PolynomialQ[Px, x] && EqQ[e, c^2*d] && IntegerQ[p - 1/2]
Int[Px_.*(f_ + g_.*(d_ + e_.*x_^2)^p_)^ m_.*(a_. + b_.*ArcSinh[c_.*x_])^n_., x_Symbol] := With[{u = ExpandIntegrand[ Px*(f + g*(d + e*x^2)^p)^m*(a + b*ArcSinh[c*x])^n, x]}, Int[u, x] /; SumQ[u]] /; FreeQ[{a, b, c, d, e, f, g}, x] && PolynomialQ[Px, x] && EqQ[e, c^2*d] && IGtQ[p + 1/2, 0] && IntegersQ[m, n]
Int[RFx_*ArcSinh[c_.*x_]^n_., x_Symbol] := With[{u = ExpandIntegrand[ArcSinh[c*x]^n, RFx, x]}, Int[u, x] /; SumQ[u]] /; FreeQ[c, x] && RationalFunctionQ[RFx, x] && IGtQ[n, 0]
Int[RFx_*(a_ + b_.*ArcSinh[c_.*x_])^n_., x_Symbol] := Int[ExpandIntegrand[RFx*(a + b*ArcSinh[c*x])^n, x], x] /; FreeQ[{a, b, c}, x] && RationalFunctionQ[RFx, x] && IGtQ[n, 0]
Int[RFx_*(d_ + e_.*x_^2)^p_*ArcSinh[c_.*x_]^n_., x_Symbol] := With[{u = ExpandIntegrand[(d + e*x^2)^p*ArcSinh[c*x]^n, RFx, x]}, Int[u, x] /; SumQ[u]] /; FreeQ[{c, d, e}, x] && RationalFunctionQ[RFx, x] && IGtQ[n, 0] && EqQ[e, c^2*d] && IntegerQ[p - 1/2]
Int[RFx_*(d_ + e_.*x_^2)^p_*(a_ + b_.*ArcSinh[c_.*x_])^n_., x_Symbol] := Int[ExpandIntegrand[(d + e*x^2)^p, RFx*(a + b*ArcSinh[c*x])^n, x], x] /; FreeQ[{a, b, c, d, e}, x] && RationalFunctionQ[RFx, x] && IGtQ[n, 0] && EqQ[e, c^2*d] && IntegerQ[p - 1/2]
Int[u_.*(a_. + b_.*ArcSinh[c_.*x_])^n_., x_Symbol] := Unintegrable[u*(a + b*ArcSinh[c*x])^n, x] /; FreeQ[{a, b, c, n}, x]
