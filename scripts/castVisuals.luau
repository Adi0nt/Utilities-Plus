local a local b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u={function()a(1)return(
function(...)local b,c,d,e,f=0.25,2.5,0.5,true,{}function f:Hide()self.
CastOriginPart.Parent=nil end function f:Raycast(g,h,i)local j=self local k=j.
WorldRoot:Raycast(g,h,i)if not k then j:Hide()return end j.CastOriginPart.CFrame
=CFrame.lookAt(g,k.Position)j.LineVisual.Length=k.Distance-b j.ConeVisual.CFrame
=CFrame.new(0,0,-k.Distance)j.BoxVisual.Visible=false j.SphereVisual.Visible=
false j.CastOriginPart.Parent=j.WorldRoot:FindFirstChild'Terrain'or j.WorldRoot
end function f:Blockcast(g,h,i,j)local k=self local l=k.WorldRoot:Blockcast(g,h,
i,j)if not l then k:Hide()return end k.CastOriginPart.CFrame=g local m,n=CFrame.
lookAt(Vector3.zero,i.Unit),CFrame.new(i.Unit*l.Distance)k.LineVisual.Length=l.
Distance-b k.LineVisual.CFrame=m k.ConeVisual.CFrame=CFrame.lookAt(n.Position-(i
.Unit*b),n.Position+i)k.BoxVisual.CFrame=n k.BoxVisual.Size=h k.BoxVisual.
Visible=true k.SphereVisual.Visible=false k.CastOriginPart.Parent=k.WorldRoot:
FindFirstChild'Terrain'or k.WorldRoot end function f:SphereCast(g,h,i,j)local k=
self local l=k.WorldRoot:Spherecast(g,h,i,j)if not l then k:Hide()return end
local m=g+(i.Unit*l.Distance)k.CastOriginPart.CFrame=CFrame.lookAt(g,m)k.
LineVisual.Length=l.Distance-b k.ConeVisual.CFrame=CFrame.new(0,0,-l.Distance)k.
SphereVisual.CFrame=CFrame.new(0,0,-l.Distance)k.SphereVisual.Radius=h k.
SphereVisual.Visible=true k.BoxVisual.Visible=false k.CastOriginPart.Parent=k.
WorldRoot:FindFirstChild'Terrain'or k.WorldRoot end local g,h={},{__index=f}
function g.new(i,j)local k,l=setmetatable({Color=i or Color3.new(0,0,1),
WorldRoot=j or workspace},h),Instance.new'Part'l.Transparency=1 l.CanCollide=
false l.CanQuery=false l.CanTouch=false l.Anchored=true l.Size=Vector3.one/100 k
.CastOriginPart=l local m=Instance.new'LineHandleAdornment'm.Color3=k.Color m.
AlwaysOnTop=e m.Transparency=d m.Thickness=c m.ZIndex=1 m.Adornee=l m.Parent=l k
.LineVisual=m local n=Instance.new'ConeHandleAdornment'n.Color3=k.Color n.
AlwaysOnTop=e n.Transparency=d n.Radius=0.05 n.Height=b n.SizeRelativeOffset=
Vector3.new(0,0,b*2)n.ZIndex=1 n.Adornee=l n.Parent=l k.ConeVisual=n local o=
Instance.new'BoxHandleAdornment'o.Color3=k.Color o.AlwaysOnTop=e o.Transparency=
d o.ZIndex=0 o.Adornee=l o.Parent=l k.BoxVisual=o local p=Instance.new
'SphereHandleAdornment'p.Color3=k.Color p.AlwaysOnTop=e p.Transparency=d p.
ZIndex=0 p.Adornee=l p.Parent=l k.SphereVisual=p return k end return g end)()end
},{{1,2,{'CastVisuals'}}},'0.4.2','Utilities Plus',string,task,setmetatable,
error,next,table,unpack,coroutine,script,type,require,pcall,tostring,tonumber,
_VERSION local v,w,x,y,z,A,B=k.insert,k.remove,k.freeze or function(v)return v
end,m.wrap,f.sub,f.match,f.gmatch if t and z(t,1,4)=='Lune'then local C,D=q(p,
'@lune/task')if C and D then g=D end end local C=g and g.defer local D,E,F,G,H,I
,J,K,L=C or function(D,...)y(D)(...)end,{[1]='Folder',[2]='ModuleScript',[3]=
'Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local M,N={
GetFullName={{},function(M)local N,O=M.Name,M.Parent while O do N=O.Name..'.'..N
O=O.Parent end return N end},GetChildren={{},function(M)local N={}for O in j,L[M
]do v(N,O)end return N end},GetDescendants={{},function(M)local N={}for O in j,L
[M]do v(N,O)for P,Q in j,O:GetDescendants()do v(N,Q)end end return N end},
FindFirstChild={{'string','boolean?'},function(M,N,O)local P=L[M]for Q in j,P do
if Q.Name==N then return Q end end if O then for Q in j,P do return Q:
FindFirstChild(N,true)end end end},FindFirstAncestor={{'string'},function(M,N)
local O=M.Parent while O do if O.Name==N then return O end O=O.Parent end end},
WaitForChild={{'string','number?'},function(M,N)return M:FindFirstChild(N)end}},
{}for O,P in j,M do local Q,R,S=P[1],P[2],{}for T,U in j,Q do local V,W=A(U,
'^([^%?]+)(%??)')S[T]={V,W}end N[O]=function(T,...)if not L[T]then i(
"Expected ':' not '.' calling member function "..O,2)end local U={...}for V,W in
j,S do local X=U[V]local Y,Z,_=o(X),W[1],W[2]if X==nil and not _ then i(
'Argument '..X..' missing or nil',3)end if Z~='any'and Y~=Z and not(Y=='nil'and
_)then i('Argument '..V..' expects type "'..Z..'", got "'..Y..'"',2)end end
return R(T,...)end end local function O(P,Q,R)local S,T=(h({},{__mode='k'}))
local function U(V)i(V..' is not a valid (virtual) member of '..P..' "'..Q..'"',
3)end local function V(W)i('Unable to assign (virtual) property '..W..
'. Property is read only',3)end local W,X={},{}X.__metatable=false X.__index=
function(Y,Z)if Z=='ClassName'then return P elseif Z=='Name'then return Q elseif
Z=='Parent'then return R elseif P=='StringValue'and Z=='Value'then return T else
local _=N[Z]if _ then return _ end end for _ in j,S do if _.Name==Z then return
_ end end U(Z)end X.__newindex=function(Y,Z,_)if Z=='ClassName'then V(Z)elseif Z
=='Name'then Q=_ elseif Z=='Parent'then if _==W then return end if R~=nil then L
[R][W]=nil end R=_ if _~=nil then L[_][W]=true end elseif P=='StringValue'and Z
=='Value'then T=_ else U(Z)end end X.__tostring=function()return Q end h(W,X)L[W
]=S if R~=nil then L[R][W]=true end return W end local function P(Q,R)local S,T,
U,V=Q[1],Q[2],Q[3],Q[4]local W=E[T]local X=U and w(U,1)or W local Y=O(W,X,R)F[S]
=Y if U then for Z,_ in j,U do Y[Z]=_ end end if V then for Z,_ in j,V do P(_,Y)
end end return Y end local Q=O('Folder','['..e..']')for R,S in j,c do P(S,Q)end
for R,S in j,b do local T=F[R]G[T]=S H[T]=R local U=T.ClassName if U==
'LocalScript'or U=='Script'then v(J,T)end end local function R(S)local T,U=S.
ClassName,I[S]if U and T=='ModuleScript'then return l(U)end local V=G[S]
local function W(X)X=r(X)local Y,Z,_=S:GetFullName(),A(X,'[^:]+:(%d+): (.+)')if
not Z or not u then return Y..':*: '..(_ or X)end Z=s(Z)local aa=H[S]local ab=u[
aa]local ac=Z-ab+1 if ac<0 then ac='?'end return Y..':'..ac..': '.._ end if T==
'LocalScript'or T=='Script'then local aa,ab=q(V)if not aa then i(W(ab),0)end
else local aa={q(V)}local ab=w(aa,1)if not ab then local ac=w(aa,1)i(W(ac),0)end
I[S]=aa return l(aa)end end function a(aa)local ab=F[aa]local function ac(S,...)
local T={q(S,...)}local U=w(T,1)if not U then i(T[1],3)end return l(T)end local
S=x(h({},{__index=K,__newindex=function(S,T,U)K[T]=U end,__len=function()return#
K end,__iter=function()return j,K end}))local T,U=x{version=d,envname=e,shared=S
,script=n,require=p},ab local function V(W,...)local X,Y,Z=o(W),
'Attempted to call require with a non-ModuleScript',
'Attempted to call require with self'if X=='table'and L[W]then if W.ClassName~=
'ModuleScript'then i(Y,2)elseif W==ab then i(Z,2)end return R(W)elseif X==
'string'and z(W,1,1)~='@'then if#W==0 then i(
'Attempted to call require with empty string',2)end local _=ab if z(W,1,1)=='/'
then _=Q elseif z(W,1,2)=='./'then W=z(W,3)end local ad for ae in B(W,
'([^/]*)/?')do local af=ae if ae=='..'then af='Parent'end if af~=''then local ag
=_:FindFirstChild(af)if not ag then local ah=_.Parent if ah then ag=ah:
FindFirstChild(af)end end if ag then _=ag elseif ae~=ad and ae~='init'and ae~=
'init.server'and ae~='init.client'then i('Virtual script path "'..W..
'" not found',2)end end ad=ae end if _.ClassName~='ModuleScript'then i(Y,2)
elseif _==ab then i(Z,2)end return R(_)end return ac(p,W,...)end return T,U,V
end for aa,ab in j,J do D(R,ab)end return R(Q:GetChildren()[1])