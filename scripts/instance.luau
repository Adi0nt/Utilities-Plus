local a local b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u={function()a(1)return(
function(...)local b,c=Instance.new,{}local d,e,f={'string','boolean','number',
'BrickColor','Color3','Vector3','CFrame','Instance','Ray'},{'string','boolean',
'number','UDim','UDim2','BrickColor','Color3','Vector2','Vector3','CFrame',
'NumberSequence','ColorSequence','NumberRange','Rect','Font'},{string=
'StringValue',boolean='BoolValue',number=function(d)return d%1==0 and'IntValue'
or'NumberValue'end,BrickColor='BrickColorValue',Color3='Color3Value',Vector3=
'Vector3Value',CFrame='CFrameValue',Instance='ObjectValue',Ray='RayValue'}
local function g(h,i,j,k)local l=b(h)if i~=nil then for m,n in pairs(i)do if m==
'Parent'then continue end l[m]=n end end if k~=nil then for m,n in pairs(k)do l:
SetAttribute(m,n)end end if j~=nil then for m,n in ipairs(j)do n.Parent=l end
end if i~=nil and i.Parent~=nil then l.Parent=i.Parent end return l end
local function h(i,j,k)if j.Parent~=nil then if k(j.Parent)then return j.Parent
else return h(c,j.Parent,k)end end return nil end local function i(j,k,l)for m,n
in ipairs(k:GetChildren())do if l(n)then return n end end return nil end
local function j(k,l,m)for n,o in ipairs(l:GetDescendants())do if m(o)then
return o end end return nil end local function k(l,m,n)local o={}for p,q in
ipairs(m:GetChildren())do if n(q)then table.insert(o,q)end end return o end
local function l(m,n,o)local p={}for q,r in ipairs(n:GetDescendants())do if o(r)
then table.insert(p,r)end end return p end local function m(n,o,p,q,r)local s,t,
u,v=coroutine.running(),{}for w,x in ipairs(p[n](p))do if q(x)then u=x break
elseif t[x]==nil then t[x]=x.Changed:Connect(function()if q(x)then u=x coroutine
.resume(s)end end)end end if u==nil then v=p[o]:Connect(function(w)if q(w)then u
=w coroutine.resume(s)elseif t[w]==nil then t[w]=w.Changed:Connect(function()if
q(w)then u=w coroutine.resume(s)end end)end end)local w=task.delay(r or 5,
function()if r==nil then warn(`Infinite yield possible on 'Instance:WaitFor{n==
'GetChildren'and'Child'or(n=='GetDescendants'and'Descendant'or'')}WithFilter({p:
GetFullName()}, ...)'`)else coroutine.resume(s)end end)coroutine.yield()v:
Disconnect()if coroutine.status(w)=='suspended'then task.cancel(w)end end for w,
x in pairs(t)do x:Disconnect()t[w]=nil end return u end local function n(o,p,q,r
)return m('GetChildren','ChildAdded',p,q,r)end local function o(p,q,r,s)return
m('GetDescendants','DescendantAdded',q,r,s)end local function p(q,r,s)s=s or{}
for t,u in pairs(r:GetAttributes())do s[t]=u end for t,u in ipairs(r:
GetChildren())do local v=tonumber(u.Name)or u.Name if u:IsA'ValueBase'==true
then s[v]=u.Value else s[v]={}p(c,u,s[v])end end return s end local function q(r
,s,t,u,v)s=s:lower()t=t or pairs u=u or true v=v or c.new'Folder'for w,x in t(r)
do if typeof(x)~='table'then local y=false if s=='valuebases'then if table.find(
d,typeof(x))~=nil then y=true end elseif s=='attributes'then if tonumber(w)~=nil
and u==true then if table.find(d,typeof(x))~=nil then y=true else warn(`Attempted to convert key '{
tostring(w)}' with unsupported value type '{typeof(x)}' (with numericalKeyShouldCreateValueBase = true)`
)continue end elseif table.find(e,typeof(x))~=nil then v:SetAttribute(w,x)
continue end elseif s=='mixed'then if table.find(e,typeof(x))~=nil then if
tonumber(w)~=nil and u==true then if table.find(d,typeof(x))~=nil then y=true
else warn(`Attempted to convert key '{tostring(w)}' with unsupported value type '{
typeof(x)}' (with numericalKeyShouldCreateValueBase = true)`)continue end else v
:SetAttribute(w,x)continue end elseif table.find(d,typeof(x))~=nil then y=true
end end if y==true then local z=f[typeof(x)]if typeof(z)=='function'then z=z(x)
end local A=c.new(z)A.Name=tostring(w)A.Value=x A.Parent=v else warn(`Attempted to convert key '{
tostring(w)}' with unsupported value type '{typeof(x)}'`)end else local y=c.new
'Folder'y.Name=tostring(w)y.Parent=v q(r[w],s,t,u,y)end end return v end
local function r(s,t,u,v)return q(t,'mixed',v,u)end local function s(t,u,v)
return q(u,'valuebases',nil,v)end local function t(u,v,w,x)return q(v,
'attributes',x,w)end c.new=g c.FindFirstAncestorWithFilter=h c.
FindFirstChildWithFilter=i c.FindFirstDescendantWithFilter=j c.
GetChildrenWithFilter=k c.GetDescendantsWithFilter=l c.WaitForChildWithFilter=n
c.WaitForDescendantWithFilter=o c.FolderToDataTable=p c.DataTableToFolder=r c.
DataTableToFolderUsingValueBases=s c.DataTableToFolderUsingAttributes=t return c
end)()end},{{1,2,{'Instance'}}},'0.4.2','Utilities Plus',string,task,
setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,
tostring,tonumber,_VERSION local v,w,x,y,z,A,B=k.insert,k.remove,k.freeze or
function(v)return v end,m.wrap,f.sub,f.match,f.gmatch if t and z(t,1,4)=='Lune'
then local C,D=q(p,'@lune/task')if C and D then g=D end end local C=g and g.
defer local D,E,F,G,H,I,J,K,L=C or function(D,...)y(D)(...)end,{[1]='Folder',[2]
='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{}
,{},{}local M,N={GetFullName={{},function(M)local N,O=M.Name,M.Parent while O do
N=O.Name..'.'..N O=O.Parent end return N end},GetChildren={{},function(M)local N
={}for O in j,L[M]do v(N,O)end return N end},GetDescendants={{},function(M)local
N={}for O in j,L[M]do v(N,O)for P,Q in j,O:GetDescendants()do v(N,Q)end end
return N end},FindFirstChild={{'string','boolean?'},function(M,N,O)local P=L[M]
for Q in j,P do if Q.Name==N then return Q end end if O then for Q in j,P do
return Q:FindFirstChild(N,true)end end end},FindFirstAncestor={{'string'},
function(M,N)local O=M.Parent while O do if O.Name==N then return O end O=O.
Parent end end},WaitForChild={{'string','number?'},function(M,N)return M:
FindFirstChild(N)end}},{}for O,P in j,M do local Q,R,S=P[1],P[2],{}for T,U in j,
Q do local V,W=A(U,'^([^%?]+)(%??)')S[T]={V,W}end N[O]=function(T,...)if not L[T
]then i("Expected ':' not '.' calling member function "..O,2)end local U={...}
for V,W in j,S do local X=U[V]local Y,Z,_=o(X),W[1],W[2]if X==nil and not _ then
i('Argument '..X..' missing or nil',3)end if Z~='any'and Y~=Z and not(Y=='nil'
and _)then i('Argument '..V..' expects type "'..Z..'", got "'..Y..'"',2)end end
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