local a local b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u={function()local b,c,d=a(1
)return(function(...)local e,f,g,h,i,j,k=c.Parent,d(c.Array),d(c.Map),d(c.Object
),d(c.Set),d(c.WeakMap),d(c.inspect)return{Array=f,Object=h,Map=g.Map,
coerceToMap=g.coerceToMap,coerceToTable=g.coerceToTable,Set=i,WeakMap=j,inspect=
k}end)()end,function()local b,c,d=a(2)return(function(...)local e,f=game:
GetService'HttpService',c.Parent local g,h=f.Parent,d(f.Array.isArray)local i,j,
k,l,m,n,o=10,2 local function p(q,r)local s=r or{depth=j}local t=s.depth or j s.
depth=(t>=0 and{t}or{j})[1]return k(q,{},s)end local function q(r,s)return type(
r)=='number'and r<=s and 1<=r and math.floor(r)==r end local function r(s)local
t=1 local u=rawget(s,t)while u~=nil do t+=1 u=rawget(s,t)end return t-1 end
local function s(t,u)local v,w=type(t),type(u)if v==w and(v=='number'or v==
'string')then return t<u end return v<w end local function t(u)return next,u,nil
end local function u(v)local w,x,y={},0,r(v)for z,A in t(v)do if not q(z,y)then
x=x+1 w[x]=z end end table.sort(w,s)return w,x,y end function k(v,w,x)local y=
typeof(v)if y=='string'then return e:JSONEncode(v)elseif y=='number'then if v~=v
then return'NaN'elseif v==math.huge then return'Infinity'elseif v==-math.huge
then return'-Infinity'else return tostring(v)end elseif y=='function'then local
z,A='[function',debug.info(v,'n')if A~=nil and A~=''then z..=' '..A end return z
..']'elseif y=='table'then return l(v,w,x)else return tostring(v)end end
function l(v,w,x)if table.find(w,v)~=nil then return'[Circular]'end local y={
unpack(w)}table.insert(y,v)if typeof(v.toJSON)=='function'then local z=v:toJSON(
v)if z~=v then if typeof(z)=='string'then return z else return k(z,y,x)end end
elseif h(v)then return m(v,y,x)end return n(v,y,x)end function n(v,w,x)local y,z
='',getmetatable(v)if z and rawget(z,'__tostring')then return tostring(v)end
local A,B,C=u(v)if C==0 and B==0 then y..='{}'return y end if#w>x.depth then y
..='['..o(v)..']'return y end local D={}for E=1,C do local F=k(v[E],w,x)table.
insert(D,F)end for E=1,B do local F=A[E]local G=k(v[F],w,x)table.insert(D,F..
': '..G)end y..='{ '..table.concat(D,', ')..' }'return y end function m(v,w,x)
local y=#v if y==0 then return'[]'end if#w>x.depth then return'[Array]'end local
z=math.min(i,y)local A,B=y-z,{}for C=1,z do B[C]=(k(v[C],w,x))end if A==1 then
table.insert(B,'... 1 more item')elseif A>1 then table.insert(B,(
'... %s more items'):format(tostring(A)))end return'['..table.concat(B,', ')..
']'end function o(v)return'Object'end return p end)()end,function()local b,c=a(3
)return(function(...)local d=c.Parent local e=d.Parent local f={}(f).__index=f
function f.new()local g=setmetatable({},{__mode='k'})return(setmetatable({
_weakMap=g},f))end function f:get(g)return self._weakMap[g]end function f:set(g,
h)self._weakMap[g]=h return self end function f:has(g)return self._weakMap[g]~=
nil end return f end)()end,function()local b,c,d=a(4)return(function(...)local e
=c.Parent.Parent return{concat=d(c.concat),every=d(c.every),filter=d(c.filter),
find=d(c.find),findIndex=d(c.findIndex),flat=d(c.flat),flatMap=d(c.flatMap),
forEach=d(c.forEach),from=d(c.from),includes=d(c.includes),indexOf=d(c.indexOf),
isArray=d(c.isArray),join=d(c.join),map=d(c.map),reduce=d(c.reduce),reverse=d(c.
reverse),shift=d(c.shift),slice=d(c.slice),some=d(c.some),sort=d(c.sort),splice=
d(c.splice),unshift=d(c.unshift)}end)()end,function()local b,c,d=a(5)return(
function(...)local e,f=_G.__DEV__,c.Parent local g,h=f.Parent.Parent,d(f.isArray
)local i=
[[Array.concat(...) only works with array-like tables but it received an object-like table.
You can avoid this error by wrapping the object-like table into an array. Example: `concat({1, 2}, {a = true})` should be `concat({1, 2}, { {a = true} }`]]
local function j(k,...)local l,m=0 if h(k)then m=table.clone(k)l=#(k)else l+=1 m
={}m[l]=k end for n=1,select('#',...)do local o=select(n,...)local p=typeof(o)if
o==nil then elseif p=='table'then if e then if not h(o)then error(i)end end for
q=1,#o do l+=1 m[l]=o[q]end else l+=1 m[l]=o end end return(m)end return j end)(
)end,function()local b,c=a(6)return(function(...)local d,e=_G.__DEV__,c.Parent
local f=e.Parent.Parent return function(g,h,i)if d then if typeof(g)~='table'
then error(string.format('Array.every called on %s',typeof(g)))end if typeof(h)
~='function'then error'callback is not a function'end end local j,k=#g,1 while k
<=j do local l,m=(g[k])if l~=nil then if i~=nil then m=(h)(i,l,k,g)else m=(h)(l,
k,g)end if not m then return false end end k+=1 end return true end end)()end,
function()local b,c=a(7)return(function(...)local d,e=_G.__DEV__,c.Parent local
f=e.Parent.Parent return function(g,h,i)if d then if typeof(g)~='table'then
error(string.format('Array.filter called on %s',typeof(g)))end if typeof(h)~=
'function'then error'callback is not a function'end end local j,k,l=#g,{},1 if i
==nil then for m=1,j do local n=g[m]if n~=nil then if(h)(n,m,g)then k[l]=n l+=1
end end end else for m=1,j do local n=g[m]if n~=nil then if(h)(i,n,m,g)then k[l]
=n l+=1 end end end end return k end end)()end,function()local b,c=a(8)return(
function(...)local d=c.Parent local e=d.Parent.Parent return function(f,g)for h=
1,#f do local i=f[h]if g(i,h,f)then return i end end return nil end end)()end,
function()local b,c=a(9)return(function(...)local d=c.Parent local e=d.Parent.
Parent return function(f,g)for h=1,#f do local i=f[h]if g(i,h,f)then return h
end end return-1 end end)()end,function()local b,c,d=a(10)return(function(...)
local e,f=_G.__DEV__,c.Parent local g,h=f.Parent.Parent,d(f.isArray)
local function i(j,k)if e then if typeof(j)~='table'then error(string.format(
'Array.flat called on %s',typeof(j)))end if k~=nil and typeof(k)~='number'then
error'depth is not a number or nil'end end local l,m=k or 1,{}for n,o in j do if
h(o)then local p=(o)local q=(l>1 and{(i(p,l-1))}or{p})[1]for r,s in q do table.
insert(m,s)end else table.insert(m,o)end end return m end return i end)()end,
function()local b,c,d=a(11)return(function(...)local e,f=_G.__DEV__,c.Parent
local g,h,i=f.Parent.Parent,d(f.flat),d(f.map)local function j(k,l,m)if e then
if typeof(k)~='table'then error(string.format('Array.flatMap called on %s',
typeof(k)))end if typeof(l)~='function'then error'callback is not a function'end
end return h(i(k,l,m))end return j end)()end,function()local b,c=a(12)return(
function(...)local d,e=_G.__DEV__,c.Parent local f=e.Parent.Parent return
function(g,h,i)if d then if typeof(g)~='table'then error(string.format(
'Array.forEach called on %s',typeof(g)))end if typeof(h)~='function'then error
'callback is not a function'end end local j,k=#g,1 while k<=j do local l=g[k]if
i~=nil then(h)(i,l,k,g)else(h)(l,k,g)end if#g<j then j=#g end k+=1 end end end)(
)end,function()local b,c,d=a(13)return(function(...)local e=c.Parent local f=e.
Parent.Parent local g=d(c.Parent.indexOf)return function(h,i,j)return g(h,i,j)~=
-1 end end)()end,function()local b,c=a(14)return(function(...)local d=c.Parent
local e=d.Parent.Parent return function(f,g,h)local i,j=h or 1,#f if i<1 then i=
math.max(j-math.abs(i),1)end for k=i,j do if f[k]==g then return k end end
return-1 end end)()end,function()a(15)return(function(...)return function(b)if
typeof(b)~='table'then return false end if next(b)==nil then return true end
local c=#b if c==0 then return false end local d,e=0,0 for f in pairs(b)do if
typeof(f)~='number'then return false end if f%1~=0 or f<1 then return false end
d+=1 e+=f end return e==(d*(d+1)/2)end end)()end,function()local b,c,d=a(16)
return(function(...)local e=c.Parent local f=e.Parent.Parent local g=d(e.map)
return function(h,i)if#h==0 then return''end local j=g(h,function(j)return
tostring(j)end)return table.concat(j,i or',')end end)()end,function()local b,c=
a(17)return(function(...)local d,e=_G.__DEV__,c.Parent local f=e.Parent.Parent
return function(g,h,i)if d then if typeof(g)~='table'then error(string.format(
'Array.map called on %s',typeof(g)))end if typeof(h)~='function'then error
'callback is not a function'end end local j,k,l=#g,{},1 while l<=j do local m=g[
l]if m~=nil then local n if i~=nil then n=(h)(i,m,l,g)else n=(h)(m,l,g)end k[l]=
n end l+=1 end return k end end)()end,function()local b,c=a(18)return(function(
...)local d,e=_G.__DEV__,c.Parent local f=e.Parent.Parent return function(g,h,i)
if d then if typeof(g)~='table'then error(string.format(
'Array.reduce called on %s',typeof(g)))end if typeof(h)~='function'then error
'callback is not a function'end end local j,k,l=#g,1 if i~=nil then l=i else k=2
if j==0 then error'reduce of empty array with no initial value'end l=g[1]end for
m=k,j do l=h(l,g[m],m,g)end return l end end)()end,function()local b,c=a(19)
return(function(...)local d=c.Parent local e=d.Parent.Parent return function(f)
local g,h=#f,1 while h<g do f[h],f[g]=f[g],f[h]h=h+1 g=g-1 end return f end end
)()end,function()local b,c,d=a(20)return(function(...)local e,f=_G.__DEV__,c.
Parent local g,h=f.Parent.Parent,d(f.isArray)return function(i)if e then if not
h(i)then error(string.format('Array.shift called on non-array %s',typeof(i)))end
end if#i>0 then return table.remove(i,1)else return nil end end end)()end,
function()local b,c=a(21)return(function(...)local d=c.Parent local e=d.Parent.
Parent return function(f,g,h)if typeof(f)~='table'then error(string.format(
'Array.slice called on %s',typeof(f)))end local i,j,k=#f,g or 1 if h==nil or h>i
+1 then k=i+1 else k=h end if j>i+1 then return{}end local l={}if j<1 then j=
math.max(i-math.abs(j),1)end if k<1 then k=math.max(i-math.abs(k),1)end local m,
n=j,1 while m<k do l[n]=f[m]m=m+1 n=n+1 end return l end end)()end,function()
local b,c,d=a(22)return(function(...)local e=c.Parent local f=e.Parent local g,h
=f.Parent,d(f.Object.None)local i=function(i,j)return type(i)..tostring(i)<type(
j)..tostring(j)end return function(j,k)local l=i if k~=nil and k~=h then if
typeof(k)~='function'then error
[[invalid argument to Array.sort: compareFunction must be a function]]end l=
function(m,n)local o=k(m,n)if typeof(o)~='number'then error((
[[invalid result from compare function, expected number but got %s]]):format(
typeof(o)))end return o<0 end end table.sort(j,l)return j end end)()end,function
()local b,c=a(23)return(function(...)local d=c.Parent local e=d.Parent.Parent
return function(f,g,h)if typeof(f)~='table'then error(string.format(
'Array.some called on %s',typeof(f)))end if typeof(g)~='function'then error
'callback is not a function'end for i,j in f do if h~=nil then if j~=nil and(g)(
h,j,i,f)then return true end else if j~=nil and(g)(j,i,f)then return true end
end end return false end end)()end,function()local b,c=a(24)return(function(...)
local d=c.Parent local e=d.Parent.Parent return function(f,g,h,...)if g>#f then
local i=select('#',...)for j=1,i do local k=select(j,...)table.insert(f,k)end
return{}else local i=#f if g<1 then g=math.max(i-math.abs(g),1)end local j,k={},
h or i if k>0 then local l=math.min(i,g+math.max(0,k-1))for m=g,l do local n=(
table.remove(f,g))table.insert(j,n)end end local l=select('#',...)for m=l,1,-1
do local n=select(m,...)table.insert(f,g,n)end return j end end end)()end,
function()local b,c,d=a(25)return(function(...)local e=c.Parent local f=e.Parent
local g,h,i,j,k,l,m,n=f.Parent,d(f.Set),d(f.Map.Map),d(e.isArray),d(c.fromString
),d(c.fromSet),d(c.fromMap),d(c.fromArray)return function(o,p,q)if o==nil then
error'cannot create array from a nil value'end local r,s=(typeof(o))if r==
'table'and j(o)then s=n(o,p,q)elseif instanceof(o,h)then s=l(o,p,q)elseif
instanceof(o,i)then s=m(o,p,q)elseif r=='string'then s=k(o,p,q)else s={}end
return s end end)()end,function()local b,c=a(26)return(function(...)local d=c.
Parent.Parent local e=d.Parent.Parent return function(f,g,h)local i={}if g then
local j=#(f)i=table.create(j)for k=1,j do if h~=nil then(i)[k]=(g)(h,(f)[k],k)
else(i)[k]=(g)((f)[k],k)end end else i=table.clone(f)end return i end end)()end,
function()local b,c=a(27)return(function(...)local d=c.Parent.Parent local e=d.
Parent.Parent return function(f,g,h)local i={}if g then i={}for j,k in f do if h
~=nil then(i)[j]=(g)(h,k,j)else(i)[j]=(g)(k,j)end end else i={}for j,k in f do(i
)[j]=k end end return i end end)()end,function()local b,c=a(28)return(function(
...)local d=c.Parent.Parent local e=d.Parent.Parent return function(f,g,h)local
i={}if g then i={}for j,k in f do if h~=nil then(i)[j]=(g)(h,k,j)else(i)[j]=(g)(
k,j)end end else i=table.clone((f)._array)end return i end end)()end,function()
local b,c=a(29)return(function(...)local d=c.Parent.Parent local e=d.Parent.
Parent return function(f,g,h)local i,j={},#f i=table.create(j)if g then for k=1,
j do if h~=nil then(i)[k]=(g)(h,(string.sub(f,k,k)),k)else(i)[k]=(g)((string.
sub(f,k,k)),k)end end else for k=1,j do(i)[k]=string.sub(f,k,k)end end return i
end end)()end,function()local b,c,d=a(30)return(function(...)local e,f=_G.
__DEV__,c.Parent local g,h=f.Parent.Parent,d(f.isArray)return function(i,...)if
e then if not h(i)then error(string.format(
'Array.unshift called on non-array %s',typeof(i)))end end local j=select('#',...
)if j>0 then for k=j,1,-1 do local l=select(k,...)table.insert(i,1,l)end end
return#i end end)()end,function()local b,c,d=a(31)return(function(...)local e,f,
g,h=c.Parent.Parent,d(c.Map),d(c.coerceToMap),d(c.coerceToTable)return{Map=f,
coerceToMap=g,coerceToTable=h}end)()end,function()local b,c,d=a(32)return(
function(...)local e,f=_G.__DEV__,c.Parent.Parent local g,h,i,j=f.Parent,d(f.
Array.forEach),d(f.Array.map),d(f.Array.isArray)local k=({})function k.new(l)
local m,n if l==nil then m={}n={}elseif j(l)then if e then if#(l)>0 and typeof((
l)[1])~='table'then error('Value `'..typeof((l)[1])..
[[` is not an entry object.
 Cannot create Map from {K, V} form, it must be { {K, V}... }]]
)end end m=table.create(#(l))n={}for o,p in l do local q=p[1]if e then if q==nil
then error"cannot create Map from a table that isn't an array."end end local r=p
[2]if n[q]==nil then table.insert(m,q)end n[q]=r end elseif instanceof(l,k)then
m=table.clone((l)._array)n=table.clone((l)._map)else error((
'`%s` `%s` is not iterable, cannot make Map using it'):format(typeof(l),
tostring(l)))end return((setmetatable({size=#m,_map=n,_array=m},k)))end function
k:set(l,m)if self._map[l]==nil then self.size=(self.size)+1 table.insert(self.
_array,l)end self._map[l]=m return self end function k:get(l)return self._map[l]
end function k:clear()local l=table self.size=0 l.clear(self._map)l.clear(self.
_array)end function k:delete(l)if self._map[l]==nil then return false end self.
size=(self.size)-1 self._map[l]=nil local m=table.find(self._array,l)if m then
table.remove(self._array,m)end return true end function k:forEach(l,m)if e then
if typeof(l)~='function'then error'callback is not a function'end end h(self.
_array,function(n)local o=self._map[n]if m~=nil then(l)(m,o,n,self)else(l)(o,n,
self)end end)end function k:has(l)return self._map[l]~=nil end function k:keys()
return self._array end function k:values()return i(self._array,function(l)return
self._map[l]end)end function k:entries()return i(self._array,function(l)return{l
,self._map[l]}end)end function k:ipairs()if e then warn(debug.traceback(
[[`for _,_ in myMap:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in myMap do` instead
]]
,2))end return ipairs(self:entries())end function k.__iter(l)return next,l:
entries()end function k.__index(l,m)local n=rawget(k,m)if n~=nil then return n
end if e then assert(rawget(l,'_map'),
[[Map has been corrupted, and is missing private state! Did you accidentally call table.clear() instead of map:clear()?]]
)end return k.get(l,m)end function k.__newindex(l,m,n)l:set(m,n)end return k end
)()end,function()local b,c,d=a(33)return(function(...)local e=c.Parent local f=e
.Parent local g,h,i=f.Parent,d(e.Map),d(f.Object)local function j(k)return
instanceOf(k,h)and k or h.new(i.entries(k))end return j end)()end,function()
local b,c,d=a(34)return(function(...)local e=c.Parent local f=e.Parent local g,h
,i=f.Parent,d(e.Map),d(f.Array.reduce)local function j(k)if not instanceOf(k,h)
then return k end return i(k:entries(),function(l,m)l[m[1] ]=m[2]return l end,{}
)end return j end)()end,function()local b,c,d=a(35)return(function(...)return{
assign=d(c.assign),entries=d(c.entries),freeze=d(c.freeze),is=d(c.is),isFrozen=
d(c.isFrozen),keys=d(c.keys),preventExtensions=d(c.preventExtensions),seal=d(c.
seal),values=d(c.values),None=d(c.None)}end)()end,function()a(36)return(function
(...)local b=newproxy(true)local c=getmetatable(b)c.__tostring=function()return
'Object.None'end return b end)()end,function()local b,c,d=a(37)return(function(
...)local e=c.Parent local f,g=e.Parent.Parent,d(e.None)return function(h,i,j,k,
...)if i~=nil and typeof(i)=='table'then for l,m in pairs(i)do if m==g then(h)[l
]=nil else(h)[l]=m end end end if j~=nil and typeof(j)=='table'then for l,m in
pairs(j)do if m==g then(h)[l]=nil else(h)[l]=m end end end if k~=nil and typeof(
k)=='table'then for l,m in pairs(k)do if m==g then(h)[l]=nil else(h)[l]=m end
end end for l=1,select('#',...)do local m=select(l,...)if m~=nil and typeof(m)==
'table'then for n,o in pairs(m)do if o==g then(h)[n]=nil else(h)[n]=o end end
end end return(h)end end)()end,function()local b,c=a(38)return(function(...)
local d=c.Parent local e=d.Parent.Parent return function(f)assert(f~=nil,
'cannot get entries from a nil value')local g,h=typeof(f),{}if g=='table'then
for i,j in pairs(f)do table.insert(h,{i,j})end elseif g=='string'then for i=1,
string.len(f)do h[i]={tostring(i),string.sub(f,i,i)}end end return h end end)()
end,function()local b,c=a(39)return(function(...)local d=c.Parent local e=d.
Parent.Parent return function(f)return((table.freeze(f)))end end)()end,function(
)a(40)return(function(...)return function(b,c)if b==c then return b~=0 or 1/b==1
/c else return b~=b and c~=c end end end)()end,function()local b,c=a(41)return(
function(...)local d,e=_G.__DEV__,c.Parent local f=e.Parent.Parent return
function(g)if d then print
[[Luau now has a direct table.isfrozen call that can save the overhead of this library function call]]
end return table.isfrozen(g)end end)()end,function()local b,c,d=a(42)return(
function(...)local e=c.Parent local f,g=e.Parent,e.Parent.Parent local h=d(f.Set
)return function(i)if i==nil then error'cannot extract keys from a nil value'end
local j,k=(typeof(i))if j=='table'then k={}if instanceOf(i,h)then return k end
for l in pairs(i)do table.insert(k,l)end elseif j=='string'then local l=(i):len(
)k=table.create(l)for m=1,l do k[m]=tostring(m)end end return k end end)()end,
function()local b,c=a(43)return(function(...)local d=c.Parent local e=d.Parent.
Parent local function f(g)local h=tostring(g)return((setmetatable(g,{__newindex=
function(i,j,k)local l=('%q (%s) is not a valid member of %s'):format(tostring(j
),typeof(j),h)error(l,2)end,__metatable=false})))end return f end)()end,function
()local b,c=a(44)return(function(...)local d=c.Parent local e=d.Parent.Parent
return function(f)return((table.freeze(f)))end end)()end,function()local b,c=a(
45)return(function(...)local d=c.Parent local e=d.Parent.Parent return function(
f)if f==nil then error'cannot extract values from a nil value'end local g,h=(
typeof(f))if g=='table'then h={}for i,j in pairs(f)do table.insert(h,j)end
elseif g=='string'then local i=(f):len()h=table.create(i)for j=1,i do(h)[j]=(f):
sub(j,j)end end return h end end)()end,function()local b,c,d=a(46)return(
function(...)local e,f=_G.__DEV__,c.Parent local g,h,i,j,k=f.Parent,d(f.inspect)
,d(f.Array.isArray),d(f.Array.forEach),d(f.Array.from.fromString)local l=({
__iter=function(l)return next,l._array end,__tostring=function(l)local m='Set '
if#l._array>0 then m..='('..tostring(#l._array)..') 'end m..=h(l._array)return m
end});(l).__index=l function l.new(m)local n,o={}if m~=nil then local p if
typeof(m)=='table'then if i(m)then p=table.clone(m)else local q=getmetatable(m)
if q and rawget(q,'__iter')then p=m elseif e then error
'cannot create array from an object-like table'end end elseif typeof(m)==
'string'then p=(k(m))else error(('cannot create array from value of type `%s`'):
format(typeof(m)))end if p then o=table.create(#p)for q,r in p do if not n[r]
then n[r]=true table.insert(o,r)end end else o={}end else o={}end return((
setmetatable({size=#o,_map=n,_array=o},l)))end function l:add(m)if not self._map
[m]then self.size=(self.size)+1 self._map[m]=true table.insert(self._array,m)end
return self end function l:clear()self.size=0 table.clear(self._map)table.clear(
self._array)end function l:delete(m)if not self._map[m]then return false end
self.size=(self.size)-1 self._map[m]=nil local n=table.find(self._array,m)if n
then table.remove(self._array,n)end return true end function l:forEach(m,n)if
typeof(m)~='function'then error'callback is not a function'end j(self._array,
function(o)if n~=nil then(m)(n,o,o,self)else(m)(o,o,self)end end)end function l:
has(m)return self._map[m]~=nil end function l:ipairs()if e then warn(debug.
traceback(
[[`for _,_ in mySet:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in mySet do` instead
]]
,2))end return ipairs(self._array)end return l end)()end},{{1,2,{'Collections'},
{{2,2,{'inspect'}},{35,2,{'Object'},{{45,2,{'values'}},{41,2,{'isFrozen'}},{44,2
,{'seal'}},{40,2,{'is'}},{43,2,{'preventExtensions'}},{42,2,{'keys'}},{37,2,{
'assign'}},{39,2,{'freeze'}},{36,2,{'None'}},{38,2,{'entries'}}}},{31,2,{'Map'},
{{33,2,{'coerceToMap'}},{34,2,{'coerceToTable'}},{32,2,{'Map'}}}},{4,2,{'Array'}
,{{21,2,{'slice'}},{6,2,{'every'}},{7,2,{'filter'}},{11,2,{'flatMap'}},{8,2,{
'find'}},{25,2,{'from'},{{27,2,{'fromMap'}},{29,2,{'fromString'}},{28,2,{
'fromSet'}},{26,2,{'fromArray'}}}},{15,2,{'isArray'}},{17,2,{'map'}},{5,2,{
'concat'}},{19,2,{'reverse'}},{16,2,{'join'}},{23,2,{'some'}},{30,2,{'unshift'}}
,{18,2,{'reduce'}},{10,2,{'flat'}},{12,2,{'forEach'}},{22,2,{'sort'}},{9,2,{
'findIndex'}},{24,2,{'splice'}},{13,2,{'includes'}},{20,2,{'shift'}},{14,2,{
'indexOf'}}}},{3,2,{'WeakMap'}},{46,2,{'Set'}}}}},'0.4.2','Utilities Plus',
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