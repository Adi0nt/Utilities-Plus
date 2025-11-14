local a local b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u={function()a(1)return(
function(...)local b={}function b.type(c)return function(d)local e=type(d)if e==
c then return true else return false,string.format('%s expected, got %s',c,e)end
end end function b.typeof(c)return function(d)local e=typeof(d)if e==c then
return true else return false,string.format('%s expected, got %s',c,e)end end
end function b.any(c)if c~=nil then return true else return false,
'any expected, got nil'end end b.boolean=b.typeof'boolean'b.thread=b.typeof
'thread'b.callback=b.typeof'function'b['function']=b.callback b.none=b.typeof
'nil'b['nil']=b.none b.string=b.typeof'string'b.table=b.typeof'table'b.userdata=
b.type'userdata'function b.number(c)local d=typeof(c)if d=='number'then if c==c
then return true else return false,'unexpected NaN value'end else return false,
string.format('number expected, got %s',d)end end function b.nan(c)local d=
typeof(c)if d=='number'then if c~=c then return true else return false,
'unexpected non-NaN value'end else return false,string.format(
'number expected, got %s',d)end end b.Axes=b.typeof'Axes'b.BrickColor=b.typeof
'BrickColor'b.CatalogSearchParams=b.typeof'CatalogSearchParams'b.CFrame=b.typeof
'CFrame'b.Color3=b.typeof'Color3'b.ColorSequence=b.typeof'ColorSequence'b.
ColorSequenceKeypoint=b.typeof'ColorSequenceKeypoint'b.DateTime=b.typeof
'DateTime'b.DockWidgetPluginGuiInfo=b.typeof'DockWidgetPluginGuiInfo'b.Enum=b.
typeof'Enum'b.EnumItem=b.typeof'EnumItem'b.Enums=b.typeof'Enums'b.Faces=b.typeof
'Faces'b.Instance=b.typeof'Instance'b.NumberRange=b.typeof'NumberRange'b.
NumberSequence=b.typeof'NumberSequence'b.NumberSequenceKeypoint=b.typeof
'NumberSequenceKeypoint'b.PathWaypoint=b.typeof'PathWaypoint'b.
PhysicalProperties=b.typeof'PhysicalProperties'b.Random=b.typeof'Random'b.Ray=b.
typeof'Ray'b.RaycastParams=b.typeof'RaycastParams'b.RaycastResult=b.typeof
'RaycastResult'b.RBXScriptConnection=b.typeof'RBXScriptConnection'b.
RBXScriptSignal=b.typeof'RBXScriptSignal'b.Rect=b.typeof'Rect'b.Region3=b.typeof
'Region3'b.Region3int16=b.typeof'Region3int16'b.TweenInfo=b.typeof'TweenInfo'b.
UDim=b.typeof'UDim'b.UDim2=b.typeof'UDim2'b.Vector2=b.typeof'Vector2'b.
Vector2int16=b.typeof'Vector2int16'b.Vector3=b.typeof'Vector3'b.Vector3int16=b.
typeof'Vector3int16'function b.literal(...)local c=select('#',...)if c==1 then
local d=...return function(e)if e~=d then return false,string.format(
'expected %s, got %s',tostring(d),tostring(e))end return true end else local d={
}for e=1,c do local f=select(e,...)d[e]=b.literal(f)end return b.union(table.
unpack(d,1,c))end end b.exactly=b.literal function b.keyOf(c)local d,e={},0 for
f in pairs(c)do e=e+1 d[e]=f end return b.literal(table.unpack(d,1,e))end
function b.valueOf(c)local d,e={},0 for f,g in pairs(c)do e=e+1 d[e]=g end
return b.literal(table.unpack(d,1,e))end function b.integer(c)local d,e=b.
number(c)if not d then return false,e or''end if c%1==0 then return true else
return false,string.format('integer expected, got %s',c)end end function b.
numberMin(c)return function(d)local e,f=b.number(d)if not e then return false,f
or''end if d>=c then return true else return false,string.format(
'number >= %s expected, got %s',c,d)end end end function b.numberMax(c)return
function(d)local e,f=b.number(d)if not e then return false,f end if d<=c then
return true else return false,string.format('number <= %s expected, got %s',c,d)
end end end function b.numberMinExclusive(c)return function(d)local e,f=b.
number(d)if not e then return false,f or''end if c<d then return true else
return false,string.format('number > %s expected, got %s',c,d)end end end
function b.numberMaxExclusive(c)return function(d)local e,f=b.number(d)if not e
then return false,f or''end if d<c then return true else return false,string.
format('number < %s expected, got %s',c,d)end end end b.numberPositive=b.
numberMinExclusive(0)b.numberNegative=b.numberMaxExclusive(0)function b.
numberConstrained(c,d)assert(b.number(c))assert(b.number(d))local e,f=b.
numberMin(c),b.numberMax(d)return function(g)local h,i=e(g)if not h then return
false,i or''end local j,k=f(g)if not j then return false,k or''end return true
end end function b.numberConstrainedExclusive(c,d)assert(b.number(c))assert(b.
number(d))local e,f=b.numberMinExclusive(c),b.numberMaxExclusive(d)return
function(g)local h,i=e(g)if not h then return false,i or''end local j,k=f(g)if
not j then return false,k or''end return true end end function b.match(c)assert(
b.string(c))return function(d)local e,f=b.string(d)if not e then return false,f
end if string.match(d,c)==nil then return false,string.format(
'%q failed to match pattern %q',d,c)end return true end end function b.optional(
c)assert(b.callback(c))return function(d)if d==nil then return true end local e,
f=c(d)if e then return true else return false,string.format('(optional) %s',f or
'')end end end function b.tuple(...)local c={...}return function(...)local d={
...}for e,f in ipairs(c)do local g,h=f(d[e])if g==false then return false,string
.format('Bad tuple index #%s:\n\t%s',e,h or'')end end return true end end
function b.keys(c)assert(b.callback(c))return function(d)local e,f=b.table(d)if
e==false then return false,f or''end for g in pairs(d)do local h,i=c(g)if h==
false then return false,string.format('bad key %s:\n\t%s',tostring(g),i or'')end
end return true end end function b.values(c)assert(b.callback(c))return function
(d)local e,f=b.table(d)if e==false then return false,f or''end for g,h in pairs(
d)do local i,j=c(h)if i==false then return false,string.format(
'bad value for key %s:\n\t%s',tostring(g),j or'')end end return true end end
function b.map(c,d)assert(b.callback(c))assert(b.callback(d))local e,f=b.keys(c)
,b.values(d)return function(g)local h,i=e(g)if not h then return false,i or''end
local j,k=f(g)if not j then return false,k or''end return true end end function
b.set(c)return b.map(c,b.literal(true))end do local c=b.keys(b.integer)function
b.array(d)assert(b.callback(d))local e=b.values(d)return function(f)local g,h=c(
f)if g==false then return false,string.format('[array] %s',h or'')end local i=0
for j in ipairs(f)do i=i+1 end for j in pairs(f)do if j<1 or j>i then return
false,string.format('[array] key %s must be sequential',tostring(j))end end
local j,k=e(f)if not j then return false,string.format('[array] %s',k or'')end
return true end end function b.strictArray(...)local d={...}assert(b.array(b.
callback)(d))return function(e)local f,g=c(e)if f==false then return false,
string.format('[strictArray] %s',g or'')end if#d<#e then return false,string.
format('[strictArray] Array size exceeds limit of %d',#d)end for h,i in pairs(d)
do local j,k=i(e[h])if not j then return false,string.format(
'[strictArray] Array index #%d - %s',h,k)end end return true end end end do
local c=b.array(b.callback)function b.union(...)local d={...}assert(c(d))return
function(e)for f,g in ipairs(d)do if g(e)then return true end end return false,
'bad type for union'end end b.some=b.union function b.intersection(...)local d={
...}assert(c(d))return function(e)for f,g in ipairs(d)do local h,i=g(e)if not h
then return false,i or''end end return true end end b.every=b.intersection end
do local c=b.map(b.any,b.callback)function b.interface(d)assert(c(d))return
function(e)local f,g=b.table(e)if f==false then return false,g or''end for h,i
in pairs(d)do local j,k=i(e[h])if j==false then return false,string.format(
'[interface] bad value for %s:\n\t%s',tostring(h),k or'')end end return true end
end function b.strictInterface(d)assert(c(d))return function(e)local f,g=b.
table(e)if f==false then return false,g or''end for h,i in pairs(d)do local j,k=
i(e[h])if j==false then return false,string.format(
'[interface] bad value for %s:\n\t%s',tostring(h),k or'')end end for h in pairs(
e)do if not d[h]then return false,string.format(
'[interface] unexpected field %q',tostring(h))end end return true end end end
function b.instanceOf(c,d)assert(b.string(c))local e if d~=nil then e=b.
children(d)end return function(f)local g,h=b.Instance(f)if not g then return
false,h or''end if f.ClassName~=c then return false,string.format(
'%s expected, got %s',c,f.ClassName)end if e then local i,j=e(f)if not i then
return false,j end end return true end end b.instance=b.instanceOf function b.
instanceIsA(c,d)assert(b.string(c))local e if d~=nil then e=b.children(d)end
return function(f)local g,h=b.Instance(f)if not g then return false,h or''end if
not f:IsA(c)then return false,string.format('%s expected, got %s',c,f.ClassName)
end if e then local i,j=e(f)if not i then return false,j end end return true end
end function b.enum(c)assert(b.Enum(c))return function(d)local e,f=b.EnumItem(d)
if not e then return false,f end if d.EnumType==c then return true else return
false,string.format('enum of %s expected, got enum of %s',tostring(c),tostring(d
.EnumType))end end end do local c=b.tuple(b.callback,b.callback)function b.wrap(
d,e)assert(c(d,e))return function(...)assert(e(...))return d(...)end end end
function b.strict(c)return function(...)assert(c(...))end end do local c=b.map(b
.string,b.callback)function b.children(d)assert(c(d))return function(e)local f,g
=b.Instance(e)if not f then return false,g or''end local h={}for i,j in ipairs(e
:GetChildren())do local k=j.Name if d[k]then if h[k]then return false,string.
format('Cannot process multiple children with the same name %q',k)end h[k]=j end
end for i,j in pairs(d)do local k,l=j(h[i])if not k then return false,string.
format('[%s.%s] %s',e:GetFullName(),i,l or'')end end return true end end end
return b end)()end},{{1,2,{'t'}}},'0.4.2','Utilities Plus',string,task,
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