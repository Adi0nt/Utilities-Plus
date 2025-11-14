local a local b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u={function()local b,c,d=a(1
)return(function(...)return{Dictionary=d(c.Dictionary),List=d(c.List),isEmpty=d(
c.isEmpty),None=d(c.None)}end)()end,function()local b,c,d=a(2)return(function(
...)return{equals=d(c.equals),filter=d(c.filter),join=d(c.join),keys=d(c.keys),
map=d(c.map),omit=d(c.omit),union=d(c.union),values=d(c.values)}end)()end,
function()local b,c,d=a(3)return(function(...)local e=d(c.Parent.Parent.
equalObjects)local function f(g,h)if type(g)~='table'or type(h)~='table'then
return g==h end for i,j in g do if h[i]~=j then return false end end for i,j in
h do if g[i]~=j then return false end end return true end local function g(...)
if e(...)then return true end local h,i=select('#',...),select(1,...)for j=2,h
do local k=select(j,...)if not f(i,k)then return false end end return true end
return g end)()end,function()local b,c,d=a(4)return(function(...)local e=d(c.
Parent.equals)return function()it(
[[should return whether provided objects have reference equality]],function()
local f={foo=1,bar=2,baz=3,qux={}}local g,h={foo=1,bar=2,baz=3,qux=f.qux},{foo=1
,bar=2,baz=3,qux={}}expect(e(f,g)).to.equal(true)expect(e(f,h)).to.equal(false)
end)it('should work with an arbitrary number of objects',function()local f={foo=
1,bar=2,baz=3}local g,h,i=f,{foo=1,bar=2,baz=3},{oof=4,rab=5,zab=6}local j,k=i,{
oof=4,rab=5,zab=6}expect(e(f,g,h)).to.equal(true)expect(e(f,g,h,i,j,k)).to.
equal(false)end)it('should work with one object',function()local f={}expect(e(f)
).to.equal(true)end)it('should work with zero objects',function()expect(e()).to.
equal(true)end)it('should work with nil entry',function()local f={}expect(e(nil,
f)).to.equal(false)end)it(
'should return false if the second dict has an extra key',function()local f,g={
hello='world'},{hello='world',foo='bar'}expect(e(f,g)).to.equal(false)end)end
end)()end,function()a(5)return(function(...)local function b(c,d)local e={}for f
,g in c do if d(g,f)then e[f]=g end end return e end return b end)()end,function
()local b,c,d=a(6)return(function(...)local e=d(c.Parent.filter)return function(
)local f=table.freeze{a=1,b=2,c=3,d=4}it('should filter even',function()local g=
e(f,function(g)return g%2==0 end)expect(g).toEqual{b=2,d=4}end)it(
'should filter all',function()local g=e(f,function(g)return false end)expect(g).
toEqual{}end)it('should work with an empty table',function()local g=false
local function h()g=true return true end local i=e({},h)expect(next(i)).never.to
.be.ok()expect(g).to.equal(false)end)end end)()end,function()local b,c,d=a(7)
return(function(...)return function()it('should load',function()d(c.Parent)end)
end end)()end,function()local b,c,d=a(8)return(function(...)local e=d(c.Parent.
Parent.None)local function f(...)local g=select('#',...)if g==0 then return{}
elseif g==1 then local h=table.clone(...)setmetatable(h,nil)return h end local h
=table.clone(select(1,...))setmetatable(h,nil)for i=2,g do local j=select(i,...)
for k,l in pairs(j)do if l==e then h[k]=nil else h[k]=l end end end return h end
return f end)()end,function()local b,c,d=a(9)return(function(...)return function
()local e,f=d(c.Parent.join),d(c.Parent.Parent.None)it(
'should return a new table',function()local g={}expect(e(g)).never.to.equal(g)
end)it('should merge tables, overwriting previous values',function()local g,h={
foo='foo-a',bar='bar-a'},{foo='foo-b',baz='baz-b'}local i=e(g,h)expect(i.foo).to
.equal(h.foo)expect(i.bar).to.equal(g.bar)expect(i.baz).to.equal(h.baz)end)it(
'should remove values set to None',function()local g,h={foo='foo-a'},{foo=f}
local i=e(g,h)expect(i.foo).to.equal(nil)end)it(
'should not mutate passed in tables',function()local g,h,i,j=0,0,{},{foo='foo-b'
}setmetatable(i,{__newindex=function()g=g+1 end})setmetatable(j,{__newindex=
function()h=h+1 end})e(i,j)expect(g).to.equal(0)expect(h).to.equal(0)expect(j.
foo).to.equal'foo-b'end)it('should not copy metatables of passed in tables',
function()local g,h=setmetatable({foo='foo-a'},{__index=function()end}),
setmetatable({foo='foo-b'},{__index=function()end})local i,j=e(g,h),e(g)expect(
getmetatable(i)).to.equal(nil)expect(getmetatable(j)).to.equal(nil)end)it(
'should accept arbitrary numbers of tables',function()local g,h,i={foo='foo-a'},
{bar='bar-b'},{baz='baz-c'}local j=e(g,h,i)expect(j.foo).to.equal(g.foo)expect(j
.bar).to.equal(h.bar)expect(j.baz).to.equal(i.baz)end)it(
'should accept zero tables',function()expect(e()).to.be.a'table'end)it(
'should safely iterate through tables with call metamethods',function()local g=
setmetatable({A=1},{__call=function(g,...)error(...)end})expect(function()e({},g
)end).never.to.throw()end)end end)()end,function()a(10)return(function(...)
local function b(c)local d,e={},1 for f in pairs(c)do d[e]=f e=e+1 end return d
end return b end)()end,function()local b,c,d=a(11)return(function(...)return
function()local e,f=d(c.Parent.keys),d(c.Parent.Parent.None)it(
'should not mutate the given table',function()local g,h={Foo='FooValue',Bar=
'BarValue'},{Foo='FooValue',Bar='BarValue'}e(g)for i,j in pairs(g)do expect(h[i]
).to.equal(j)end for i,j in pairs(h)do expect(g[i]).to.equal(j)end end)it(
'should return the correct keys',function()local g,h={Foo='FooValue',Bar=
'BarValue',Test='TestValue'},{Foo=1,Bar=1,Test=1}local i=e(g)expect(#i).to.
equal(3)for j,k in ipairs(i)do expect(h[k]).never.to.equal(nil)h[k]=h[k]-1 end
for j,k in pairs(h)do expect(k).to.equal(0)end end)it(
'should work with an empty table',function()local g=e{}expect(next(g)).to.equal(
nil)end)it(
[[should contain a None element if there is a None key in the dictionary]],
function()local g,h={[f]='Foo',Bar='BarValue'},{[f]=1,Bar=1}local i=e(g)expect(#
i).to.equal(2)for j,k in ipairs(i)do expect(h[k]).never.to.equal(nil)h[k]=h[k]-1
end for j,k in pairs(h)do expect(k).to.equal(0)end end)end end)()end,function()
a(12)return(function(...)local function b(c,d)local e={}for f,g in c do local h,
i=d(g,f)local j=(i==nil and{f}or{i})[1]if h~=nil then e[j]=h end end return e
end return b end)()end,function()local b,c,d=a(13)return(function(...)local e=d(
c.Parent.map)return function()local f={a=1,b=2,c=3}it('should map the value',
function()local g=e(f,function(g,h)return g*10,h end)expect(g).toEqual{a=10,b=20
,c=30}end)it('should change output dict type',function()local g=e(f,function(g,h
)return tostring(g),h end)expect(g).toEqual{a='1',b='2',c='3'}end)it(
'should filter with nil',function()local g=e(f,function(g,h)return(g==2 and{nil}
or{g})[1],h end)expect(g).toEqual{a=1,c=3}end)it(
'should convert list to dictionary',function()local g={'a','b','c'}local h=e(g,
function(h)return 0,'a'end)expect(h).toEqual{a=0}end)it(
[[should set the new values to the first result of the given callback]],function
()local g={foo=1,bar=2,baz=3}local function h(i)return i*2 end local i=e(g,h)for
j,k in pairs(i)do expect(h(g[j])).to.equal(k)end end)end end)()end,function()a(
14)return(function(...)local function b(c,...)local d=table.clone(c)for e,f in{
...}do d[f]=nil end return d end return b end)()end,function()local b,c,d=a(15)
return(function(...)local e=d(c.Parent.omit)return function()local f={a=1,b=2,c=
3}it('should remove 1 value',function()local g=e(f,'a')expect(g).toEqual{b=2,c=3
}end)it('should remove 2 values',function()local g=e(f,'a','b')expect(g).toEqual
{c=3}end)it('should work even if entry does not exist',function()local g={foo=1,
bar=2}local h=e(g,'baz')expect(h).toEqual{foo=1,bar=2}end)end end)()end,function
()a(16)return(function(...)local function b(c,d)local e=table.clone(c)for f,g in
d do e[f]=g end return e end return b end)()end,function()local b,c,d=a(17)
return(function(...)return function()local e=d(c.Parent.union)it(
'should combine two tables',function()local f,g={hello='world'},{foo='bar'}local
h=e(f,g)expect(h).toEqual{hello='world',foo='bar'}end)it(
'should prefer values from the second table',function()local f,g={hello='world'}
,{hello='bar'}local h=e(f,g)expect(h).toEqual{hello='bar'}end)it(
'should preseve old values if not in new table',function()local f,g={hello=
'world',foo='bar'},{hello='bar'}local h=e(f,g)expect(h).toEqual{hello='bar',foo=
'bar'}end)end end)()end,function()a(18)return(function(...)local function b(c)
local d,e={},1 for f,g in pairs(c)do d[e]=g e=e+1 end return d end return b end
)()end,function()local b,c,d=a(19)return(function(...)return function()local e,f
=d(c.Parent.values),d(c.Parent.Parent.None)it(
'should not mutate the given table',function()local g,h={Foo='FooValue',Bar=
'BarValue'},{Foo='FooValue',Bar='BarValue'}e(g)for i,j in pairs(g)do expect(h[i]
).to.equal(j)end for i,j in pairs(h)do expect(g[i]).to.equal(j)end end)it(
'should return the correct values',function()local g,h={Foo='FooValue',Bar=
'BarValue',Test='TestValue'},{FooValue=1,BarValue=1,TestValue=1}local i=e(g)
expect(#i).to.equal(3)for j,k in ipairs(i)do expect(h[k]).never.to.equal(nil)h[k
]=h[k]-1 end for j,k in pairs(h)do expect(k).to.equal(0)end end)it(
'should return duplicates if two values are the same',function()local g,h={Foo=
'FooValue',Bar='BarValue',Test='FooValue'},{FooValue=2,BarValue=1}local i=e(g)
expect(#i).to.equal(3)for j,k in ipairs(i)do expect(h[k]).never.to.equal(nil)h[k
]=h[k]-1 end for j,k in pairs(h)do expect(k).to.equal(0)end end)it(
'should work with an empty table',function()local g=e{}expect(next(g)).to.equal(
nil)end)it(
[[should contain a None element if there is a None value in the dictionary]],
function()local g,h={Foo=f,Bar='BarValue'},{[f]=1,BarValue=1}local i=e(g)expect(
#i).to.equal(2)for j,k in ipairs(i)do expect(h[k]).never.to.equal(nil)h[k]=h[k]-
1 end for j,k in pairs(h)do expect(k).to.equal(0)end end)end end)()end,function(
)local b,c,d=a(20)return(function(...)return{equals=d(c.equals),filter=d(c.
filter),filterMap=d(c.filterMap),find=d(c.find),findWhere=d(c.findWhere),
foldLeft=d(c.foldLeft),foldRight=d(c.foldRight),getRange=d(c.getRange),join=d(c.
join),map=d(c.map),removeIndex=d(c.removeIndex),removeRange=d(c.removeRange),
removeValue=d(c.removeValue),replaceIndex=d(c.replaceIndex),reverse=d(c.reverse)
,sort=d(c.sort),toSet=d(c.toSet)}end)()end,function()local b,c,d=a(21)return(
function(...)local e=d(c.Parent.Parent.equalObjects)local function f(g,h)if
type(g)~='table'or type(h)~='table'then return g==h end if#g~=#h then return
false end for i=1,#g do if g[i]~=h[i]then return false end end return true end
local function g(...)if e(...)then return true end local h,i=select('#',...),
select(1,...)for j=2,h do local k=select(j,...)if not f(i,k)then return false
end end return true end return g end)()end,function()local b,c,d=a(22)return(
function(...)local e=d(c.Parent.equals)return function()it(
'should return a boolean',function()local f={}expect(e(f,f)).to.be.a'boolean'
expect(e(f,{})).to.be.a'boolean'expect(e({},{1})).to.be.a'boolean'end)it(
[[should return whether provided tables have value equality or not]],function()
local f={'foo','bar','baz',{}}local g,h={'foo','bar','baz',f[4]},{'foo','bar',
'baz',{}}expect(e(f,g)).to.equal(true)expect(e(f,h)).to.equal(false)end)it(
'should work with an arbitrary number of tables',function()local f={'foo','bar',
'baz'}local g,h,i=f,{'foo','bar','baz'},{'oof','rab','zab'}local j,k=i,{'oof',
'rab','zab'}expect(e(f,g,h)).to.equal(true)expect(e(f,g,h,i,j,k)).to.equal(false
)end)it('should work with one table',function()local f={}expect(e(f)).to.equal(
true)end)it('should work with zero tables',function()expect(e()).to.equal(true)
end)it('should work with objects',function()local f,g={balance=100},{balance=200
}expect(e({f},{g})).to.equal(false)end)it('should work with nested objects',
function()local f,g={a={balance=100}},{a={balance=200}}expect(e({f},{g})).to.
equal(false)end)it('should work with nil entry',function()expect(e(nil,{})).to.
equal(false)end)end end)()end,function()a(23)return(function(...)local function
b(c,d)local e,f={},1 for g=1,#c do local h=c[g]if d(h,g)then e[f]=h f=f+1 end
end return e end return b end)()end,function()local b,c,d=a(24)return(function(
...)return function()local e=d(c.Parent.filter)it(
'should call the callback for each element',function()local f,g={'foo1','foo2',
'foo3'},{}local function h(i,j)g[j]=i return true end e(f,h)for i,j in pairs(f)
do expect(g[i]).to.equal(j)end for i,j in pairs(g)do expect(j).to.equal(f[i])end
end)it('should correctly use the filter callback',function()local f={1,2,3,4,5}
local function g(h)return h%2==0 end local h=e(f,g)expect(#h).to.equal(2)expect(
h[1]).to.equal(2)expect(h[2]).to.equal(4)end)it('should copy the list correctly'
,function()local f={1,2,3}local function g()return true end local h=e(f,g)
expect(h).never.to.equal(f)for i,j in pairs(f)do expect(h[i]).to.equal(j)end for
i,j in pairs(h)do expect(j).to.equal(f[i])end end)it(
'should work with an empty table',function()local f=false local function g()f=
true return true end local h=e({},g)expect(#h).to.equal(0)expect(f).to.equal(
false)end)it(
[[should remove all element from a list when callback return always false]],
function()local f={6,2,8,6,7}local function g()return false end local h=e(f,g)
expect(#h).to.equal(0)end)end end)()end,function()a(25)return(function(...)
local function b(c,d)local e,f={},1 for g=1,#c do local h=d(c[g],g)if h~=nil
then e[f]=h f=f+1 end end return e end return b end)()end,function()local b,c,d=
a(26)return(function(...)return function()local e=d(c.Parent.filterMap)it(
'should return a new table',function()local f={1,2,3}local function g()return 1
end local h=e(f,g)expect(h).never.to.equal(f)end)it(
'should call the callback for each element',function()local f,g={'foo1','foo2',
'foo3'},{}local function h(i,j)g[j]=i return i end e(f,h)for i,j in pairs(f)do
expect(g[i]).to.equal(j)end for i,j in pairs(g)do expect(j).to.equal(f[i])end
end)it('should correctly use the filter callback',function()local f={1,2,3,4,5}
local function g(h)if h%2==0 then return nil else return h*2 end end local h=e(f
,g)expect(#h).to.equal(3)expect(h[1]).to.equal(2)expect(h[2]).to.equal(6)expect(
h[3]).to.equal(10)end)it('should copy the list correctly',function()local f={1,2
,3}local function g(h)return h end local h=e(f,g)expect(h).never.to.equal(f)for
i,j in pairs(f)do expect(h[i]).to.equal(j)end for i,j in pairs(h)do expect(j).to
.equal(f[i])end end)it('should work with an empty table',function()local f=false
local function g()f=true return true end local h=e({},g)expect(#h).to.equal(0)
expect(f).to.equal(false)end)it(
[[should remove all elements from a list when callback return always nil]],
function()local f={6,2,8,6,7}local function g()return nil end local h=e(f,g)
expect(#h).to.equal(0)end)end end)()end,function()a(27)return(function(...)
local function b(c,d)for e=1,#c do if c[e]==d then return e end end return nil
end return b end)()end,function()local b,c,d=a(28)return(function(...)return
function()local e=d(c.Parent.find)it('should return the correct index',function(
)local f={5,4,3,2,1}expect(e(f,1)).to.equal(5)expect(e(f,2)).to.equal(4)expect(
e(f,3)).to.equal(3)expect(e(f,4)).to.equal(2)expect(e(f,5)).to.equal(1)end)it(
'should work with an empty table',function()expect(e({},1)).to.equal(nil)end)it(
'should return nil when the given value is not found',function()local f={1,2,3}
expect(e(f,4)).to.equal(nil)expect(type(e(f,4))).to.equal'nil'end)it(
'should return the index of the first value found',function()local f={1,2,2}
expect(e(f,2)).to.equal(2)end)end end)()end,function()a(29)return(function(...)
local function b(c,d)for e=1,#c do if d(c[e],e)then return e end end return nil
end return b end)()end,function()local b,c,d=a(30)return(function(...)return
function()local e=d(c.Parent.findWhere)it('should return the correct index',
function()local f,g,h={1,5,10,7},function(f)return f%2==0 end,function(f)return
f%2==1 end expect(e(f,g)).to.equal(3)expect(e(f,h)).to.equal(1)end)it(
'should work with an empty table',function()local f=function()return true end
expect(e({},f)).to.equal(nil)end)it(
[[should return nil when the when no value satisfies the predicate]],function()
local f,g={1,2,3},function(f)return f==4 end expect(e(f,g)).to.equal(nil)end)it(
[[should return the index of the first value for which the predicate is true]],
function()local f,g={1,1,1,2,2},function(f)return f==2 end expect(e(f,g)).to.
equal(4)end)it([[should allow access to table index in the predicate function]],
function()local f,g={5,4,3,2,1},function(f,g)return g==4 end expect(e(f,g)).to.
equal(4)end)it(
[[should allow access to both value and index in the predicate function]],
function()local f,g={1,1,2,2,1},function(f,g)return f+g==5 end expect(e(f,g)).to
.equal(3)end)end end)()end,function()a(31)return(function(...)local function b(c
,d,e)local f=e for g=1,#c do f=d(f,c[g],g)end return f end return b end)()end,
function()local b,c,d=a(32)return(function(...)return function()local e=d(c.
Parent.foldLeft)it('should call the callback',function()local f,g={1,2,3},0 e(f,
function()g=g+1 end,0)expect(g).to.equal(3)end)it(
'should not call the callback when the list is empty',function()local f=false e(
{},function()f=true end,0)expect(f).to.equal(false)end)it(
'should call the callback for each element',function()local f,g={4,5,6},{}e(f,
function(h,i,j)g[j]=i return h end,0)expect(#g).to.equal(#f)for h,i in pairs(f)
do expect(i).to.equal(g[h])end end)it(
'should pass the same modified initial value to the callback',function()local f,
g={5,4,3},{}e(f,function(h)expect(h).to.equal(g)return h end,g)end)it(
'should call the callback in the correct order',function()local f,g={5,4,3},1 e(
f,function(h,i)expect(i).to.equal(f[g])g=g+1 return h end,0)end)end end)()end,
function()a(33)return(function(...)local function b(c,d,e)local f=e for g=#c,1,-
1 do f=d(f,c[g],g)end return f end return b end)()end,function()local b,c,d=a(34
)return(function(...)return function()local e=d(c.Parent.foldRight)it(
'should call the callback',function()local f,g={1,2,3},0 e(f,function()g=g+1 end
,0)expect(g).to.equal(3)end)it(
'should not call the callback when the list is empty',function()local f=false e(
{},function()f=true end,0)expect(f).to.equal(false)end)it(
'should call the callback for each element',function()local f,g={4,5,6},{}e(f,
function(h,i,j)g[j]=i return h end,0)expect(#g).to.equal(#f)for h,i in pairs(f)
do expect(i).to.equal(g[h])end end)it(
'should pass the same modified initial value to the callback',function()local f,
g={5,4,3},{}e(f,function(h)expect(h).to.equal(g)return h end,g)end)it(
'should call the callback in the correct order',function()local f,g={5,4,3},3 e(
f,function(h,i)expect(i).to.equal(f[g])g=g-1 return h end,0)end)end end)()end,
function()a(35)return(function(...)local function b(c,d,e)assert(d<=e,
'startIndex must be less than or equal to endIndex')local f,g={},1 for h=math.
max(1,d),math.min(#c,e)do f[g]=c[h]g=g+1 end return f end return b end)()end,
function()local b,c,d=a(36)return(function(...)return function()local e=d(c.
Parent.getRange)it('should return the correct range',function()local f={1,2,3,4}
local g=e(f,2,3)expect(g[1]).to.equal(2)expect(g[2]).to.equal(3)expect(#g).to.
equal(2)local h=e(f,4,4)expect(#h).to.equal(1)expect(h[1]).to.equal(4)end)it(
[[should throw when the start index is higher than the end index]],function()
local f={5,8,7,2,3,7}expect(function()e(f,4,1)end).to.throw()end)it(
'should copy the table',function()local f={6,8,1,3,7,2}local g=e(f,1,#f)for h,i
in pairs(f)do expect(g[h]).to.equal(i)end for h,i in pairs(g)do expect(i).to.
equal(f[h])end end)it('should work with an empty table',function()local f=e({},1
,5)expect(f).to.be.a'table'expect(#f).to.equal(0)end)it(
'should work when the start index is smaller that 1',function()local f={1,2,3,4}
local g=e(f,-2,2)expect(#g).to.equal(2)expect(g[1]).to.equal(1)expect(g[2]).to.
equal(2)end)it([[should work when the end index is larger that the list length]]
,function()local f={1,2,3,4}local g=e(f,3,18)expect(#g).to.equal(2)expect(g[1]).
to.equal(3)expect(g[2]).to.equal(4)end)end end)()end,function()local b,c,d=a(37)
return(function(...)return function()it('should load',function()d(c.Parent)end)
end end)()end,function()local b,c,d=a(38)return(function(...)local e=d(c.Parent.
Parent.None)local function f(...)local g={}for h=1,select('#',...)do local i,j=
select(h,...),#g for k=1,#i do if i[k]==e then j=j-1 else g[j+k]=i[k]end end end
return g end return f end)()end,function()local b,c,d=a(39)return(function(...)
return function()local e,f=d(c.Parent.join),d(c.Parent.Parent.None)it(
'should return a new table',function()local g={}expect(e(g)).never.to.equal(g)
end)it('should remove elements equal to None',function()local g,h={'foo-a'},{f,
'foo-b'}local i=e(g,h)expect(i[1]).to.equal'foo-a'expect(i[2]).to.equal'foo-b'
expect(i[3]).to.equal(nil)end)it('should accept arbitrary numbers of tables',
function()local g,h,i={1},{2},{3}local j=e(g,h,i)expect(#j).to.equal(3)expect(j[
1]).to.equal(1)expect(j[2]).to.equal(2)expect(j[3]).to.equal(3)end)it(
'should accept zero tables',function()expect(e()).to.be.a'table'end)end end)()
end,function()a(40)return(function(...)local function b(c,d)local e={}for f=1,#c
do e[f]=d(c[f],f)end return e end return b end)()end,function()local b,c,d=a(41)
return(function(...)return function()local e=d(c.Parent.map)it(
'should return a new table',function()local f={1,2,3}expect(e(f,function()end)).
never.to.equal(f)end)it('should call the callback for each element',function()
local f,g={5,6,7},{}e(f,function(h,i)g[i]=h return h end)for h,i in pairs(f)do
expect(g[h]).to.equal(i)end for h,i in pairs(g)do expect(i).to.equal(f[h])end
end)it('should copy list',function()local f={1,2,3}local g=e(f,function(g)return
g end)for h,i in pairs(f)do expect(g[h]).to.equal(i)end for h,i in pairs(g)do
expect(i).to.equal(f[h])end end)it(
[[should sets the new values to the result of the given callback]],function()
local f={5,6,7}local g=e(f,function(g)return g*2 end)expect(#g).to.equal(#f)for
h=1,#f do expect(g[h]).to.equal(f[h]*2)end end)it(
'should work with an empty list',function()local f={}local g=e(f,function()end)
expect(g).to.be.a'table'expect(g).never.to.equal(f)end)end end)()end,function()
a(42)return(function(...)local function b(c,d)local e,f={},0 for g=1,#c do if g
==d then f=1 else e[g-f]=c[g]end end return e end return b end)()end,function()
local b,c,d=a(43)return(function(...)return function()local e,f=d(c.Parent.
removeIndex),d(c.Parent.Parent.None)it(
'should remove the element at the given index',function()local g={'first',
'second','third'}local h=e(g,2)expect(#h).to.equal(2)expect(h[1]).to.equal
'first'expect(h[2]).to.equal'third'end)it(
'should not remove any element if index is out of bound',function()local g={
'first','second','third'}local h=e(g,4)expect(#h).to.equal(#g)for i=1,#g do
expect(h[i]).to.equal(g[i])end local i=e(g,-2)expect(#i).to.equal(#g)for j=1,#g
do expect(i[j]).to.equal(g[j])end end)it('should work with a None element',
function()local g={'first',f,'third'}local h=e(g,1)expect(#h).to.equal(2)expect(
h[1]).to.equal(f)expect(h[2]).to.equal'third'end)end end)()end,function()a(44)
return(function(...)local function b(c,d,e)assert(d<=e,
'startIndex must be less than or equal to endIndex')local f,g={},1 for h=1,math.
min(#c,d-1)do f[g]=c[h]g=g+1 end for h=e+1,#c do f[g]=c[h]g=g+1 end return f end
return b end)()end,function()local b,c,d=a(45)return(function(...)return
function()local e,f=d(c.Parent.removeRange),d(c.Parent.Parent.None)it(
'should remove elements properly',function()local g={1,2,3}local h=e(g,2,2)
expect(#h).to.equal(2)expect(h[1]).to.equal(1)expect(h[2]).to.equal(3)local i={1
,2,3,4,5,6}local j=e(i,1,4)expect(#j).to.equal(2)expect(j[1]).to.equal(5)expect(
j[2]).to.equal(6)local k=e(i,2,5)expect(#k).to.equal(2)expect(k[1]).to.equal(1)
expect(k[2]).to.equal(6)end)it(
[[should throw when the start index is higher than the end index]],function()
local g={1,2,3}expect(function()e(g,2,0)end).to.throw()expect(function()e(g,1,-1
)end).to.throw()end)it(
[[should copy the table when then indexes are higher than the list length]],
function()local g={1,2,3}local h=e(g,4,7)expect(#h).to.equal(3)expect(h[1]).to.
equal(1)expect(h[2]).to.equal(2)expect(h[3]).to.equal(3)end)it(
'should work when the start index is smaller than 1',function()local g={1,2,3,4}
local h=e(g,-5,2)expect(#h).to.equal(2)expect(h[1]).to.equal(3)expect(h[2]).to.
equal(4)end)it(
[[should work when the end index is greater than the list length]],function()
local g={1,2,3,4}local h=e(g,3,8)expect(#h).to.equal(2)expect(h[1]).to.equal(1)
expect(h[2]).to.equal(2)end)it('should work with a None element',function()local
g={1,f,3}local h=e(g,1,1)expect(#h).to.equal(2)expect(h[1]).to.equal(f)expect(h[
2]).to.equal(3)end)end end)()end,function()a(46)return(function(...)
local function b(c,d)local e,f={},1 for g=1,#c do if c[g]~=d then e[f]=c[g]f=f+1
end end return e end return b end)()end,function()local b,c,d=a(47)return(
function(...)return function()local e,f=d(c.Parent.removeValue),d(c.Parent.
Parent.None)it('should remove the given value',function()local g={1,4,3}local h=
e(g,4)expect(h[1]).to.equal(1)expect(h[2]).to.equal(3)end)it(
'should remove all occurences of the same given value',function()local g={1,2,2,
3}local h=e(g,2)expect(#h).to.equal(2)expect(h[1]).to.equal(1)expect(h[2]).to.
equal(3)end)it('should work with an empty list',function()local g=e({},1)expect(
g).to.be.a'table'expect(#g).to.equal(0)end)it('should work with a None element',
function()local g={1,2,f,3}local h=e(g,2)expect(#h).to.equal(3)expect(h[1]).to.
equal(1)expect(h[2]).to.equal(f)expect(h[3]).to.equal(3)local i=e(g,f)expect(i[3
]).to.equal(3)expect(#i).to.equal(3)end)end end)()end,function()a(48)return(
function(...)local function b(c,d,e)local f,g={},#c assert(d<=g,
'index must be less or equal than the list length')for h=1,g do if h==d then f[h
]=e else f[h]=c[h]end end return f end return b end)()end,function()local b,c,d=
a(49)return(function(...)return function()local e=d(c.Parent.replaceIndex)it(
'should return a new table',function()local f={1,2,3}expect(e(f,2,0)).never.to.
equal(f)end)it('should not mutate the original list',function()local f,g={false,
'foo',3},{}e(f,2,g)expect(#f).to.equal(3)expect(f[1]).to.equal(false)expect(f[2]
).to.equal'foo'expect(f[3]).to.equal(3)end)it(
'should replace the value at the given index',function()local f,g={1,2,3},{}
local h=e(f,2,g)expect(h[1]).to.equal(1)expect(h[2]).to.equal(g)expect(h[3]).to.
equal(3)expect(next(h[2])).to.equal(nil)end)it(
[[should throw if the given index is higher than the list length]],function()
local f={1}expect(function()e(f,#f+1,{})end).to.throw()end)it(
'should be able to replace to a falsy value',function()local f={}local g,h={f,
false,'value',true},false local i=e(g,3,h)expect(i[1]).to.equal(f)expect(i[2]).
to.equal(false)expect(i[3]).to.equal(h)expect(i[4]).to.equal(true)end)end end)()
end,function()a(50)return(function(...)local function b(c)local d,e={},#c local
f=e+1 for g=1,e do d[g]=c[f-g]end return d end return b end)()end,function()
local b,c,d=a(51)return(function(...)return function()local e=d(c.Parent.reverse
)it('should return a new table',function()local f={1,2,3}expect(e(f)).never.to.
equal(f)end)it('should not mutate the given table',function()local f={1,2,3}e(f)
expect(#f).to.equal(3)expect(f[1]).to.equal(1)expect(f[2]).to.equal(2)expect(f[3
]).to.equal(3)end)it('should contain the same elements',function()local f,g={
'Foo','Bar'},{Foo=true,Bar=true}local h=e(f)expect(#h).to.equal(2)for i,j in
ipairs(h)do expect(g[j]).to.equal(true)end end)it('should reverse the list',
function()local f={1,2,3,4}local g=e(f)expect(g[1]).to.equal(4)expect(g[2]).to.
equal(3)expect(g[3]).to.equal(2)expect(g[4]).to.equal(1)end)end end)()end,
function()a(52)return(function(...)local function b(c,d)local e={}for f=1,#c do
e[f]=c[f]end table.sort(e,d)return e end return b end)()end,function()local b,c,
d=a(53)return(function(...)return function()local e=d(c.Parent.sort)it(
'should return a new table',function()local f={}expect(e(f)).never.to.equal(f)
end)it('should not mutate the given table',function()local f={77,'foo',2}
local function g(h,i)return tostring(h)<tostring(i)end e(f,g)expect(#f).to.
equal(3)expect(f[1]).to.equal(77)expect(f[2]).to.equal'foo'expect(f[3]).to.
equal(2)end)it('should contain the same elements from the given table',function(
)local f,g={'Foo','Bar','Test'},{Foo=true,Bar=true,Test=true}local h=e(f)expect(
#h).to.equal(3)for i,j in ipairs(h)do expect(g[j]).to.equal(true)end end)it(
[[should sort with the default table.sort when no callback is given]],function()
local f={4,2,5,3,1}local g=e(f)table.sort(f)expect(#g).to.equal(#f)for h=1,#f do
expect(g[h]).to.equal(f[h])end end)it('should sort with the given callback',
function()local f={1,2,5,3,4}local function g(h,i)return h>i end local h=e(f,g)
table.sort(f,g)expect(#h).to.equal(#f)for i=1,#f do expect(h[i]).to.equal(f[i])
end end)it('should work with an empty table',function()local f=e{}expect(#f).to.
equal(0)end)end end)()end,function()a(54)return(function(...)local function b(c)
local d={}for e=1,#c do d[c[e] ]=true end return d end return b end)()end,
function()local b,c,d=a(55)return(function(...)return function()local e=d(c.
Parent.toSet)it('should return a new table',function()local f={1,2,3}expect(e(f)
).never.to.equal(f)end)it('should not mutate the given table',function()local f=
{'a','b','c'}e(f)for g,h in pairs(f)do if g==1 then expect(h).to.equal'a'elseif
g==2 then expect(h).to.equal'b'elseif g==3 then expect(h).to.equal'c'else error
'Extra key was added to table a'end end end)it(
'should have every value in a as a key mapped to true in b',function()local f={1
,2,3,'a','b','c'}local g=e(f)expect(#g).to.equal(3)expect(g[1]).to.equal(true)
expect(g[2]).to.equal(true)expect(g[3]).to.equal(true)expect(g[4]).to.equal(nil)
expect(g.a).to.equal(true)expect(g.b).to.equal(true)expect(g.c).to.equal(true)
end)end end)()end,function()a(56)return(function(...)local b=newproxy(true)
getmetatable(b).__tostring=function()return'Cryo.None'end return b end)()end,
function()local b,c,d=a(57)return(function(...)return function()local e=d(c.
Parent.None)it('should be a userdata',function()expect(e).to.be.a'userdata'end)
it('should have a nice string name',function()local f=tostring(e)expect(f:find
'^userdata: ').never.to.be.ok()expect(f:find'None').to.be.ok()end)end end)()end,
function()a(58)return(function(...)local function b(...)local c=select(1,...)for
d=2,select('#',...)do if c~=select(d,...)then return false end end return true
end return b end)()end,function()local b,c,d=a(59)return(function(...)local e=d(
c.Parent.equalObjects)local function f(g,h)if type(g)~='table'or type(h)~=
'table'then return g==h end for i,j in g do if not f(h[i],j)then return false
end end for i,j in h do if not f(g[i],j)then return false end end return true
end local function g(...)if e(...)then return true end local h,i=select('#',...)
,select(1,...)for j=2,h do local k=select(j,...)if not f(i,k)then return false
end end return true end return g end)()end,function()local b,c,d=a(60)return(
function(...)local e=d(c.Parent.equalsDeep)return function()it(
'should return true for two identical tables',function()local f,g={1,2,{3,4}},{1
,2,{3,4}}expect(e(f,g)).to.equal(true)end)it(
'should return false for two different tables',function()local f,g={1,2,{3,4}},{
1,2,{5,6}}expect(e(f,g)).to.equal(false)end)it(
'should return true for two identical complex tables',function()local f,g={1,2,{
3,4,{5,6}}},{1,2,{3,4,{5,6}}}expect(e(f,g)).to.equal(true)end)it(
'should return false for two different complex tables',function()local f,g={1,2,
{3,4,{5,6}}},{1,2,{3,4,{7,8}}}expect(e(f,g)).to.equal(false)end)describe(
'with missing keys',function()local f,g={a=1,b=2},{a=1}it(
[[should return false for two different dictionaries with missing keys with the longer table first]]
,function()expect(e(f,g)).to.equal(false)end)it(
[[should return false for two different dictionaries with missing keys with the longer table second]]
,function()expect(e(g,f)).to.equal(false)end)end)it(
'should return true for the same table reference',function()local f={}expect(e(f
,f)).to.equal(true)end)end end)()end,function()local b,c,d=a(61)return(function(
...)local e=d(c.Parent.equalsDeep)local function f(g)if type(g)=='table'then
local h={}for i,j in pairs(g)do local k=(type(i)=='number'and{(f(j))}or{(f(i)..
'='..f(j))})[1]table.insert(h,k)end return'{'..table.concat(h,', ')..'}'else
return tostring(g)end end return function()beforeAll(function()expect.extend{
toEqual=function(g,h)if g==h then return{pass=true,message=
'Expected to not equal'}end if e(g,h)then return{pass=true,message=
'Expected to not equal'}else return{pass=false,message=string.format(
'Does not equal.\n\t\tGot:      %q\n\t\tExpected: %q\n\n',f(g),f(h))}end end,
toBe=function(g,h)return{pass=g==h,message=string.format(
'Does not equal.\n\t\tGot:      %q\n\t\tExpected: %q\n\n',f(g),f(h))}end}end)it(
'should load',function()d(c.Parent)end)end end)()end,function()a(62)return(
function(...)local function b(c)return next(c)==nil end return b end)()end,
function()local b,c,d=a(63)return(function(...)return function()local e=d(c.
Parent.isEmpty)it('should return true on an empty table',function()expect(e{}).
to.equal(true)end)it('should return false with a list of values',function()
expect(e{1,2,3}).to.equal(false)end)it(
'should return false with a dictionary of keys and values',function()expect(e{
key='value'}).to.equal(false)end)end end)()end},{{1,2,{'Cryo'},{{20,2,{'List'},{
{38,2,{'join'}},{37,2,{'init.spec'}},{42,2,{'removeIndex'}},{43,2,{
'removeIndex.spec'}},{47,2,{'removeValue.spec'}},{26,2,{'filterMap.spec'}},{44,2
,{'removeRange'}},{29,2,{'findWhere'}},{45,2,{'removeRange.spec'}},{36,2,{
'getRange.spec'}},{39,2,{'join.spec'}},{52,2,{'sort'}},{27,2,{'find'}},{30,2,{
'findWhere.spec'}},{50,2,{'reverse'}},{31,2,{'foldLeft'}},{51,2,{'reverse.spec'}
},{46,2,{'removeValue'}},{21,2,{'equals'}},{34,2,{'foldRight.spec'}},{41,2,{
'map.spec'}},{24,2,{'filter.spec'}},{55,2,{'toSet.spec'}},{54,2,{'toSet'}},{53,2
,{'sort.spec'}},{23,2,{'filter'}},{22,2,{'equals.spec'}},{49,2,{
'replaceIndex.spec'}},{40,2,{'map'}},{33,2,{'foldRight'}},{28,2,{'find.spec'}},{
48,2,{'replaceIndex'}},{25,2,{'filterMap'}},{32,2,{'foldLeft.spec'}},{35,2,{
'getRange'}}}},{59,2,{'equalsDeep'}},{62,2,{'isEmpty'}},{2,2,{'Dictionary'},{{6,
2,{'filter.spec'}},{13,2,{'map.spec'}},{8,2,{'join'}},{19,2,{'values.spec'}},{7,
2,{'init.spec'}},{9,2,{'join.spec'}},{4,2,{'equals.spec'}},{15,2,{'omit.spec'}},
{14,2,{'omit'}},{18,2,{'values'}},{11,2,{'keys.spec'}},{10,2,{'keys'}},{12,2,{
'map'}},{17,2,{'union.spec'}},{16,2,{'union'}},{3,2,{'equals'}},{5,2,{'filter'}}
}},{57,2,{'None.spec'}},{61,2,{'init.spec'}},{63,2,{'isEmpty.spec'}},{60,2,{
'equalsDeep.spec'}},{58,2,{'equalObjects'}},{56,2,{'None'}}}}},'0.4.2',
'Utilities Plus',string,task,setmetatable,error,next,table,unpack,coroutine,
script,type,require,pcall,tostring,tonumber,_VERSION local v,w,x,y,z,A,B=k.
insert,k.remove,k.freeze or function(v)return v end,m.wrap,f.sub,f.match,f.
gmatch if t and z(t,1,4)=='Lune'then local C,D=q(p,'@lune/task')if C and D then
g=D end end local C=g and g.defer local D,E,F,G,H,I,J,K,L=C or function(D,...)y(
D)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]=
'StringValue'},{},{},{},{},{},{},{}local M,N={GetFullName={{},function(M)local N
,O=M.Name,M.Parent while O do N=O.Name..'.'..N O=O.Parent end return N end},
GetChildren={{},function(M)local N={}for O in j,L[M]do v(N,O)end return N end},
GetDescendants={{},function(M)local N={}for O in j,L[M]do v(N,O)for P,Q in j,O:
GetDescendants()do v(N,Q)end end return N end},FindFirstChild={{'string',
'boolean?'},function(M,N,O)local P=L[M]for Q in j,P do if Q.Name==N then return
Q end end if O then for Q in j,P do return Q:FindFirstChild(N,true)end end end},
FindFirstAncestor={{'string'},function(M,N)local O=M.Parent while O do if O.Name
==N then return O end O=O.Parent end end},WaitForChild={{'string','number?'},
function(M,N)return M:FindFirstChild(N)end}},{}for O,P in j,M do local Q,R,S=P[1
],P[2],{}for T,U in j,Q do local V,W=A(U,'^([^%?]+)(%??)')S[T]={V,W}end N[O]=
function(T,...)if not L[T]then i("Expected ':' not '.' calling member function "
..O,2)end local U={...}for V,W in j,S do local X=U[V]local Y,Z,_=o(X),W[1],W[2]
if X==nil and not _ then i('Argument '..X..' missing or nil',3)end if Z~='any'
and Y~=Z and not(Y=='nil'and _)then i('Argument '..V..' expects type "'..Z..
'", got "'..Y..'"',2)end end return R(T,...)end end local function O(P,Q,R)local
S,T=(h({},{__mode='k'}))local function U(V)i(V..
' is not a valid (virtual) member of '..P..' "'..Q..'"',3)end local function V(W
)i('Unable to assign (virtual) property '..W..'. Property is read only',3)end
local W,X={},{}X.__metatable=false X.__index=function(Y,Z)if Z=='ClassName'then
return P elseif Z=='Name'then return Q elseif Z=='Parent'then return R elseif P
=='StringValue'and Z=='Value'then return T else local _=N[Z]if _ then return _
end end for _ in j,S do if _.Name==Z then return _ end end U(Z)end X.__newindex=
function(Y,Z,_)if Z=='ClassName'then V(Z)elseif Z=='Name'then Q=_ elseif Z==
'Parent'then if _==W then return end if R~=nil then L[R][W]=nil end R=_ if _~=
nil then L[_][W]=true end elseif P=='StringValue'and Z=='Value'then T=_ else U(Z
)end end X.__tostring=function()return Q end h(W,X)L[W]=S if R~=nil then L[R][W]
=true end return W end local function P(Q,R)local S,T,U,V=Q[1],Q[2],Q[3],Q[4]
local W=E[T]local X=U and w(U,1)or W local Y=O(W,X,R)F[S]=Y if U then for Z,_ in
j,U do Y[Z]=_ end end if V then for Z,_ in j,V do P(_,Y)end end return Y end
local Q=O('Folder','['..e..']')for R,S in j,c do P(S,Q)end for R,S in j,b do
local T=F[R]G[T]=S H[T]=R local U=T.ClassName if U=='LocalScript'or U=='Script'
then v(J,T)end end local function R(S)local T,U=S.ClassName,I[S]if U and T==
'ModuleScript'then return l(U)end local V=G[S]local function W(X)X=r(X)local Y,Z
,_=S:GetFullName(),A(X,'[^:]+:(%d+): (.+)')if not Z or not u then return Y..
':*: '..(_ or X)end Z=s(Z)local aa=H[S]local ab=u[aa]local ac=Z-ab+1 if ac<0
then ac='?'end return Y..':'..ac..': '.._ end if T=='LocalScript'or T=='Script'
then local aa,ab=q(V)if not aa then i(W(ab),0)end else local aa={q(V)}local ab=
w(aa,1)if not ab then local ac=w(aa,1)i(W(ac),0)end I[S]=aa return l(aa)end end
function a(aa)local ab=F[aa]local function ac(S,...)local T={q(S,...)}local U=w(
T,1)if not U then i(T[1],3)end return l(T)end local S=x(h({},{__index=K,
__newindex=function(S,T,U)K[T]=U end,__len=function()return#K end,__iter=
function()return j,K end}))local T,U=x{version=d,envname=e,shared=S,script=n,
require=p},ab local function V(W,...)local X,Y,Z=o(W),
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