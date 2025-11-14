local a local b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u={function()local b,c,d=a(1
)return(function(...)return{charCodeAt=d(c.charCodeAt),endsWith=d(c.endsWith),
findOr=d(c.findOr),includes=d(c.includes),indexOf=d(c.indexOf),lastIndexOf=d(c.
lastIndexOf),slice=d(c.slice),split=d(c.split),startsWith=d(c.startsWith),substr
=d(c.substr),trim=d(c.trim),trimEnd=d(c.trimEnd),trimStart=d(c.trimStart),
trimRight=d(c.trimEnd),trimLeft=d(c.trimStart)}end)()end,function()local b,c=a(2
)return(function(...)local d=c.Parent local e,f=d.Parent,0/0 return function(g,h
)if type(h)~='number'then h=1 end local i=string.len(g)if h<1 or h>i then return
f end local j=utf8.offset(g,h)if j==nil or j>i then return f end local k=utf8.
codepoint(g,j,j)if k==nil then return f end return k end end)()end,function()a(3
)return(function(...)local function b(c,d,e)local f=d:len()if f==0 then return
true end local g=c:len()local h=e or g if h>g then h=g end if h<1 then return
false end local i=h-f+1 return c:find(d,i,true)==i end return b end)()end,
function()a(4)return(function(...)local b='(['..('$%^()-[].?'):gsub('(.)','%%%1'
)..'])'local function c(d,e,f)local g,h=utf8.offset(d,f or 1),{}for i,j in e do
j=j:gsub(b,'%%%1')local k,l=string.find(d,j,g)if k then local m=string.sub(d,1,k
-1)local n,o=utf8.len(m)if n==nil then error((
'string `%s` has an invalid byte at position %s'):format(m,tostring(o)))end
local p=n+1 local q={index=p,match=string.sub(d,k,l)}table.insert(h,q)end end if
#h==0 then return nil end local i for j,k in h do if i==nil then i=k end if k.
index<i.index then i=k end end return i end return c end)()end,function()a(5)
return(function(...)local b='(['..('$%^()-[].?'):gsub('(.)','%%%1')..'])'
local function c(d,e,f)local g,h=utf8.len(d)assert(g~=nil,(
'string `%s` has an invalid byte at position %s'):format(d,tostring(h)))if g==0
then return false end if#e==0 then return true end local i=1 if f~=nil then i=
tonumber(f)or 1 if i>g then return false end end if i<1 then i=1 end local j,k=
utf8.offset(d,i),e:gsub(b,'%%%1')local l=string.find(d,k,j)return l~=nil end
return c end)()end,function()a(6)return(function(...)local b='(['..('$%^()-[].?'
):gsub('(.)','%%%1')..'])'return function(c,d,e)local f,g=#c,(e~=nil and{e<1 and
1 or e}or{1})[1]if#d==0 then return(g>f and{f}or{g})[1]end if g>f then return-1
end d=d:gsub(b,'%%%1')local h=#d for i=g,f do if string.sub(c,i,i+h-1)==d then
return i end end return-1 end end)()end,function()a(7)return(function(...)
local function b(c,d,e)local f,g=(string.len(c))if e then g=e else g=f end if e
and e<1 then g=1 end if e and e>f then g=f end if d==''then return g end local h
,i,j=0 repeat i=j j,h=string.find(c,d,h+1,true)until j==nil or j>g if i==nil
then return-1 end return i end return b end)()end,function()a(8)return(function(
...)local function b(c,d,e)local f,g=utf8.len(c)assert(f~=nil,(
'string `%s` has an invalid byte at position %s'):format(c,tostring(g)))local h=
tonumber(d)assert(typeof(h)=='number','startIndexStr should be a number')if h+f<
0 then h=1 end if h>f then return''end local i=f+1 if e~=nil then local j=0/0 i=
tonumber(e)or j end assert(typeof(i)=='number',
'lastIndexStr should convert to number')if i>f then i=f+1 end local j,k=utf8.
offset(c,h),utf8.offset(c,i)-1 return string.sub(c,j,k)end return b end)()end,
function()local b,c,d=a(9)return(function(...)local e=c.Parent local f,g,h=d(e.
findOr),d(e.slice),e.Parent local i=9007199254740991 local function j(k,l,m)if l
==nil then return{k}end if m==0 then return{}end local n,o,p=((m==nil or m<0)and
{i}or{m})[1],l if typeof(o)=='string'then if o==''then local q={}for r in k:
gmatch'.'do table.insert(q,r)end return q end p={o}else p=o end local q,r,s,t,u=
1,{},nil,utf8.len(k)assert(t~=nil,(
'string `%s` has an invalid byte at position %s'):format(k,tostring(u)))repeat
local v=f(k,p,q)if v~=nil then table.insert(r,g(k,q,v.index))local w=utf8.len(v.
match)q=v.index+w else table.insert(r,g(k,q,nil))end if v~=nil then s=v end
until v==nil or q>t or#r>=n if s~=nil then local v,w=utf8.len(s.match)assert(v~=
nil,('string `%s` has an invalid byte at position %s'):format(s.match,tostring(w
)))if s.index+v==t+1 then table.insert(r,'')end end return r end return j end)()
end,function()a(10)return(function(...)local function b(c,d,e)if string.len(d)==
0 then return true end local f if e==nil or e<1 then f=1 else f=e end if f>
string.len(c)then return false end return c:find(d,f,true)==f end return b end)(
)end,function()a(11)return(function(...)return function(b,c,d)if d and d<=0 then
return''end return string.sub(b,c,d and c+d-1 or nil)end end)()end,function()
local b,c,d=a(12)return(function(...)local e,f=d(c.Parent.trimStart),d(c.Parent.
trimEnd)return function(g)return e(f(g))end end)()end,function()a(13)return(
function(...)return function(b)return(b:gsub('[%s]+$',''))end end)()end,function
()a(14)return(function(...)return function(b)return(b:gsub('^[%s]+',''))end end
)()end},{{1,2,{'String'},{{8,2,{'slice'}},{2,2,{'charCodeAt'}},{7,2,{
'lastIndexOf'}},{6,2,{'indexOf'}},{5,2,{'includes'}},{9,2,{'split'}},{10,2,{
'startsWith'}},{12,2,{'trim'}},{14,2,{'trimStart'}},{13,2,{'trimEnd'}},{3,2,{
'endsWith'}},{11,2,{'substr'}},{4,2,{'findOr'}}}}},'0.4.2','Utilities Plus',
string,task,setmetatable,error,next,table,unpack,coroutine,script,type,require,
pcall,tostring,tonumber,_VERSION local v,w,x,y,z,A,B=k.insert,k.remove,k.freeze
or function(v)return v end,m.wrap,f.sub,f.match,f.gmatch if t and z(t,1,4)==
'Lune'then local C,D=q(p,'@lune/task')if C and D then g=D end end local C=g and
g.defer local D,E,F,G,H,I,J,K,L=C or function(D,...)y(D)(...)end,{[1]='Folder',[
2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},
{},{},{}local M,N={GetFullName={{},function(M)local N,O=M.Name,M.Parent while O
do N=O.Name..'.'..N O=O.Parent end return N end},GetChildren={{},function(M)
local N={}for O in j,L[M]do v(N,O)end return N end},GetDescendants={{},function(
M)local N={}for O in j,L[M]do v(N,O)for P,Q in j,O:GetDescendants()do v(N,Q)end
end return N end},FindFirstChild={{'string','boolean?'},function(M,N,O)local P=L
[M]for Q in j,P do if Q.Name==N then return Q end end if O then for Q in j,P do
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