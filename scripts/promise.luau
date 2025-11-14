local a local b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u={function()a(1)return(
function(...)local b,c,d,e='Non-promise value passed into %s at index %s',
'Please pass a list of promises to %s','Please pass a handler function to %s!',{
__mode='k'}local function f(g)if type(g)=='function'then return true end if
type(g)=='table'then local h=getmetatable(g)if h and type(rawget(h,'__call'))==
'function'then return true end end return false end local function g(h,i)local j
={}for k,l in ipairs(i)do j[l]=l end return setmetatable(j,{__index=function(k,l
)error(string.format('%s is not in %s!',l,h),2)end,__newindex=function()error(
string.format('Creating new members in %s is not allowed!',h),2)end})end local h
do h={Kind=g('Promise.Error.Kind',{'ExecutionError','AlreadyCancelled',
'NotResolvedInTime','TimedOut'})}h.__index=h function h.new(i,j)i=i or{}return
setmetatable({error=tostring(i.error)or'[This error has no error text.]',trace=i
.trace,context=i.context,kind=i.kind,parent=j,createdTick=os.clock(),
createdTrace=debug.traceback()},h)end function h.is(i)if type(i)=='table'then
local j=getmetatable(i)if type(j)=='table'then return rawget(i,'error')~=nil and
type(rawget(j,'extend'))=='function'end end return false end function h.isKind(i
,j)assert(j~=nil,'Argument #2 to Promise.Error.isKind must not be nil')return h.
is(i)and i.kind==j end function h:extend(i)i=i or{}i.kind=i.kind or self.kind
return h.new(i,self)end function h:getErrorChain()local i={self}while i[#i].
parent do table.insert(i,i[#i].parent)end return i end function h:__tostring()
local i={string.format('-- Promise.Error(%s) --',self.kind or'?')}for j,k in
ipairs(self:getErrorChain())do table.insert(i,table.concat({k.trace or k.error,k
.context},'\n'))end return table.concat(i,'\n')end end local function i(...)
return select('#',...),{...}end local function j(k,...)return k,select('#',...),
{...}end local function k(l)assert(l~=nil,'traceback is nil')return function(m)
if type(m)=='table'then return m end return h.new{error=m,kind=h.Kind.
ExecutionError,trace=debug.traceback(tostring(m),2),context=
'Promise created at:\n\n'..l}end end local function l(m,n,...)return j(xpcall(n,
k(m),...))end local function m(n,o,p,q)return function(...)local r,s,t=l(n,o,...
)if r then p(unpack(t,1,s))else q(t[1])end end end local function n(o)return
next(o)==nil end local o={Error=h,Status=g('Promise.Status',{'Started',
'Resolved','Rejected','Cancelled'}),_getTime=os.clock,_timeEvent=game:GetService
'RunService'.Heartbeat,_unhandledRejectionCallbacks={}}o.prototype={}o.__index=o
.prototype function o._new(p,q,r)if r~=nil and not o.is(r)then error(
'Argument #2 to Promise.new must be a promise or nil',2)end local s={_thread=nil
,_source=p,_status=o.Status.Started,_values=nil,_valuesLength=-1,
_unhandledRejection=true,_queuedResolve={},_queuedReject={},_queuedFinally={},
_cancellationHook=nil,_parent=r,_consumers=setmetatable({},e)}if r and r._status
==o.Status.Started then r._consumers[s]=true end setmetatable(s,o)local function
t(...)s:_resolve(...)end local function u(...)s:_reject(...)end local function v
(w)if w then if s._status==o.Status.Cancelled then w()else s._cancellationHook=w
end end return s._status==o.Status.Cancelled end s._thread=coroutine.create(
function()local w,x,y=l(s._source,q,t,u,v)if not w then u(y[1])end end)task.
spawn(s._thread)return s end function o.new(p)return o._new(debug.traceback(nil,
2),p)end function o:__tostring()return string.format('Promise(%s)',self._status)
end function o.defer(p)local q,r=(debug.traceback(nil,2))r=o._new(q,function(s,t
,u)local v v=o._timeEvent:Connect(function()v:Disconnect()local w,x,y=l(q,p,s,t,
u)if not w then t(y[1])end end)end)return r end o.async=o.defer function o.
resolve(...)local p,q=i(...)return o._new(debug.traceback(nil,2),function(r)r(
unpack(q,1,p))end)end function o.reject(...)local p,q=i(...)return o._new(debug.
traceback(nil,2),function(r,s)s(unpack(q,1,p))end)end function o._try(p,q,...)
local r,s=i(...)return o._new(p,function(t)t(q(unpack(s,1,r)))end)end function o
.try(p,...)return o._try(debug.traceback(nil,2),p,...)end function o._all(p,q,r)
if type(q)~='table'then error(string.format(c,'Promise.all'),3)end for s,t in
pairs(q)do if not o.is(t)then error(string.format(b,'Promise.all',tostring(s)),3
)end end if#q==0 or r==0 then return o.resolve{}end return o._new(p,function(s,t
,u)local v,w,x,y,z={},{},0,0,false local function A()for B,C in ipairs(w)do C:
cancel()end end local function B(C,...)if z then return end x=x+1 if r==nil then
v[C]=...else v[x]=...end if x>=(r or#q)then z=true s(v)A()end end u(A)for C,D in
ipairs(q)do w[C]=D:andThen(function(...)B(C,...)end,function(...)y=y+1 if r==nil
or#q-y<r then A()z=true t(...)end end)end if z then A()end end)end function o.
all(...)local p={...}if type(p[1])=='table'and not o.is(p[1])then p=p[1]end
return o._all(debug.traceback(nil,2),p)end function o.fold(p,q,r)assert(type(p)
=='table','Bad argument #1 to Promise.fold: must be a table')assert(f(q),
'Bad argument #2 to Promise.fold: must be a function')local s=o.resolve(r)return
o.each(p,function(t,u)s=s:andThen(function(v)return q(v,t,u)end)end):andThen(
function()return s end)end function o.some(p,q)assert(type(q)=='number',
'Bad argument #2 to Promise.some: must be a number')return o._all(debug.
traceback(nil,2),p,q)end function o.any(p)return o._all(debug.traceback(nil,2),p
,1):andThen(function(q)return q[1]end)end function o.allSettled(p)if type(p)~=
'table'then error(string.format(c,'Promise.allSettled'),2)end for q,r in pairs(p
)do if not o.is(r)then error(string.format(b,'Promise.allSettled',tostring(q)),2
)end end if#p==0 then return o.resolve{}end return o._new(debug.traceback(nil,2)
,function(q,r,s)local t,u,v={},{},0 local function w(x,...)v=v+1 t[x]=...if v>=#
p then q(t)end end s(function()for x,y in ipairs(u)do y:cancel()end end)for x,y
in ipairs(p)do u[x]=y:finally(function(...)w(x,...)end)end end)end function o.
race(p)assert(type(p)=='table',string.format(c,'Promise.race'))for q,r in pairs(
p)do assert(o.is(r),string.format(b,'Promise.race',tostring(q)))end return o.
_new(debug.traceback(nil,2),function(q,r,s)local t,u={},false local function v()
for w,x in ipairs(t)do x:cancel()end end local function w(x)return function(...)
v()u=true return x(...)end end if s(w(r))then return end for x,y in ipairs(p)do
t[x]=y:andThen(w(q),w(r))end if u then v()end end)end function o.each(p,q)
assert(type(p)=='table',string.format(c,'Promise.each'))assert(f(q),string.
format(d,'Promise.each'))return o._new(debug.traceback(nil,2),function(r,s,t)
local u,v,w={},{},false local function x()for y,z in ipairs(v)do z:cancel()end
end t(function()w=true x()end)local y={}for z,A in ipairs(p)do if o.is(A)then if
A:getStatus()==o.Status.Cancelled then x()return s(h.new{error=
'Promise is cancelled',kind=h.Kind.AlreadyCancelled,context=string.format(
[[The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.

That Promise was created at:

%s]]
,z,A._source)})elseif A:getStatus()==o.Status.Rejected then x()return s(select(2
,A:await()))end local B=A:andThen(function(...)return...end)table.insert(v,B)y[z
]=B else y[z]=A end end for z,A in ipairs(y)do if o.is(A)then local B B,A=A:
await()if not B then x()return s(A)end end if w then return end local B=o.
resolve(q(A,z))table.insert(v,B)local C,D=B:await()if not C then x()return s(D)
end u[z]=D end r(u)end)end function o.is(p)if type(p)~='table'then return false
end local q=getmetatable(p)if q==o then return true elseif q==nil then return f(
p.andThen)elseif type(q)=='table'and type(rawget(q,'__index'))=='table'and f(
rawget(rawget(q,'__index'),'andThen'))then return true end return false end
function o.promisify(p)return function(...)return o._try(debug.traceback(nil,2),
p,...)end end do local p,q function o.delay(r)assert(type(r)=='number',
'Bad argument #1 to Promise.delay, must be a number.')if not(r>=
1.6666666666666665E-2)or r==math.huge then r=1.6666666666666665E-2 end return o.
_new(debug.traceback(nil,2),function(s,t,u)local v=o._getTime()local w=v+r local
x={resolve=s,startTime=v,endTime=w}if q==nil then p=x q=o._timeEvent:Connect(
function()local y=o._getTime()while p~=nil and p.endTime<y do local z=p p=z.next
if p==nil then q:Disconnect()q=nil else p.previous=nil end z.resolve(o._getTime(
)-z.startTime)end end)else if p.endTime<w then local y=p local z=y.next while z
~=nil and z.endTime<w do y=z z=y.next end y.next=x x.previous=y if z~=nil then x
.next=z z.previous=x end else x.next=p p.previous=x p=x end end u(function()
local y=x.next if p==x then if y==nil then q:Disconnect()q=nil else y.previous=
nil end p=y else local z=x.previous z.next=y if y~=nil then y.previous=z end end
end)end)end end function o.prototype:timeout(p,q)local r=debug.traceback(nil,2)
return o.race{o.delay(p):andThen(function()return o.reject(q==nil and h.new{kind
=h.Kind.TimedOut,error='Timed out',context=string.format(
'Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s',p,r)}or q)end),
self}end function o.prototype:getStatus()return self._status end function o.
prototype:_andThen(p,q,r)self._unhandledRejection=false return o._new(p,function
(s,t)local u=s if q then u=m(p,q,s,t)end local v=t if r then v=m(p,r,s,t)end if
self._status==o.Status.Started then table.insert(self._queuedResolve,u)table.
insert(self._queuedReject,v)elseif self._status==o.Status.Resolved then u(
unpack(self._values,1,self._valuesLength))elseif self._status==o.Status.Rejected
then v(unpack(self._values,1,self._valuesLength))elseif self._status==o.Status.
Cancelled then t(h.new{error='Promise is cancelled',kind=h.Kind.AlreadyCancelled
,context='Promise created at\n\n'..p})end end,self)end function o.prototype:
andThen(p,q)assert(p==nil or f(p),string.format(d,'Promise:andThen'))assert(q==
nil or f(q),string.format(d,'Promise:andThen'))return self:_andThen(debug.
traceback(nil,2),p,q)end function o.prototype:andThenAsync(p,q)assert(p==nil or
f(p),string.format(d,'Promise:andThenAsync'))assert(q==nil or f(q),string.
format(d,'Promise:andThenAsync'))return self:_andThen(debug.traceback(nil,2),
function(...)local r,s=i(...)return o.defer(function(t)t(unpack(s,1,r))end)end,
function(...)local r,s=i(...)return o.defer(function(t,u)u(unpack(s,1,r))end)end
):andThen(p,q)end function o.prototype:catch(p)assert(p==nil or f(p),string.
format(d,'Promise:catch'))return self:_andThen(debug.traceback(nil,2),nil,p)end
function o.prototype:tap(p)assert(f(p),string.format(d,'Promise:tap'))return
self:_andThen(debug.traceback(nil,2),function(...)local q=p(...)if o.is(q)then
local r,s=i(...)return q:andThen(function()return unpack(s,1,r)end)end return...
end)end function o.prototype:andThenCall(p,...)assert(f(p),string.format(d,
'Promise:andThenCall'))local q,r=i(...)return self:_andThen(debug.traceback(nil,
2),function()return p(unpack(r,1,q))end)end function o.prototype:andThenReturn(
...)local p,q=i(...)return self:_andThen(debug.traceback(nil,2),function()return
unpack(q,1,p)end)end function o.prototype:cancel()if self._status~=o.Status.
Started then return end self._status=o.Status.Cancelled if self.
_cancellationHook then self._cancellationHook()end coroutine.close(self._thread)
if self._parent then self._parent:_consumerCancelled(self)end for p in pairs(
self._consumers)do p:cancel()end self:_finalize()end function o.prototype:
_consumerCancelled(p)if self._status~=o.Status.Started then return end self.
_consumers[p]=nil if next(self._consumers)==nil then self:cancel()end end
function o.prototype:_finally(p,q,r)if not r then self._unhandledRejection=false
end return o._new(p,function(s,t)local u=s if q then u=m(p,q,s,t)end if r then
local v=u u=function(...)if self._status==o.Status.Rejected then return s(self)
end return v(...)end end if self._status==o.Status.Started then table.insert(
self._queuedFinally,u)else u(self._status)end end,self)end function o.prototype:
finally(p)assert(p==nil or f(p),string.format(d,'Promise:finally'))return self:
_finally(debug.traceback(nil,2),p)end function o.prototype:finallyCall(p,...)
assert(f(p),string.format(d,'Promise:finallyCall'))local q,r=i(...)return self:
_finally(debug.traceback(nil,2),function()return p(unpack(r,1,q))end)end
function o.prototype:finallyReturn(...)local p,q=i(...)return self:_finally(
debug.traceback(nil,2),function()return unpack(q,1,p)end)end function o.
prototype:done(p)assert(p==nil or f(p),string.format(d,'Promise:done'))return
self:_finally(debug.traceback(nil,2),p,true)end function o.prototype:doneCall(p,
...)assert(f(p),string.format(d,'Promise:doneCall'))local q,r=i(...)return self:
_finally(debug.traceback(nil,2),function()return p(unpack(r,1,q))end,true)end
function o.prototype:doneReturn(...)local p,q=i(...)return self:_finally(debug.
traceback(nil,2),function()return unpack(q,1,p)end,true)end function o.prototype
:awaitStatus()self._unhandledRejection=false if self._status==o.Status.Started
then local p=coroutine.running()self:finally(function()task.spawn(p)end)
coroutine.yield()end if self._status==o.Status.Resolved then return self._status
,unpack(self._values,1,self._valuesLength)elseif self._status==o.Status.Rejected
then return self._status,unpack(self._values,1,self._valuesLength)end return
self._status end local function p(q,...)return q==o.Status.Resolved,...end
function o.prototype:await()return p(self:awaitStatus())end local function q(r,
...)if r~=o.Status.Resolved then error((...)==nil and
'Expected Promise rejected with no value.'or(...),3)end return...end function o.
prototype:expect()return q(self:awaitStatus())end o.prototype.awaitValue=o.
prototype.expect function o.prototype:_unwrap()if self._status==o.Status.Started
then error('Promise has not resolved or rejected.',2)end local r=self._status==o
.Status.Resolved return r,unpack(self._values,1,self._valuesLength)end function
o.prototype:_resolve(...)if self._status~=o.Status.Started then if o.is((...))
then(...):_consumerCancelled(self)end return end if o.is((...))then if select(
'#',...)>1 then local r=string.format(
[[When returning a Promise from andThen, extra arguments are discarded! See:

%s]]
,self._source)warn(r)end local r=...local s=r:andThen(function(...)self:
_resolve(...)end,function(...)local s=r._values[1]if r._error then s=h.new{error
=r._error,kind=h.Kind.ExecutionError,context=
[=[[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]]=]
}end if h.isKind(s,h.Kind.ExecutionError)then return self:_reject(s:extend{error
='This Promise was chained to a Promise that errored.',trace='',context=string.
format(
[[The Promise at:

%s
...Rejected because it was chained to the following Promise, which encountered an error:
]]
,self._source)})end self:_reject(...)end)if s._status==o.Status.Cancelled then
self:cancel()elseif s._status==o.Status.Started then self._parent=s s._consumers
[self]=true end return end self._status=o.Status.Resolved self._valuesLength,
self._values=i(...)for r,s in ipairs(self._queuedResolve)do coroutine.wrap(s)(
...)end self:_finalize()end function o.prototype:_reject(...)if self._status~=o.
Status.Started then return end self._status=o.Status.Rejected self._valuesLength
,self._values=i(...)if not n(self._queuedReject)then for r,s in ipairs(self.
_queuedReject)do coroutine.wrap(s)(...)end else local r=tostring((...))coroutine
.wrap(function()o._timeEvent:Wait()if not self._unhandledRejection then return
end local s=string.format('Unhandled Promise rejection:\n\n%s\n\n%s',r,self.
_source)for t,u in ipairs(o._unhandledRejectionCallbacks)do task.spawn(u,self,
unpack(self._values,1,self._valuesLength))end if o.TEST then return end warn(s)
end)()end self:_finalize()end function o.prototype:_finalize()for r,s in ipairs(
self._queuedFinally)do coroutine.wrap(s)(self._status)end self._queuedFinally=
nil self._queuedReject=nil self._queuedResolve=nil if not o.TEST then self.
_parent=nil self._consumers=nil end task.defer(coroutine.close,self._thread)end
function o.prototype:now(r)local s=debug.traceback(nil,2)if self._status==o.
Status.Resolved then return self:_andThen(s,function(...)return...end)else
return o.reject(r==nil and h.new{kind=h.Kind.NotResolvedInTime,error=
'This Promise was not resolved in time for :now()',context=
':now() was called at:\n\n'..s}or r)end end function o.retry(r,s,...)assert(f(r)
,'Parameter #1 to Promise.retry must be a function')assert(type(s)=='number',
'Parameter #2 to Promise.retry must be a number')local t,u={...},select('#',...)
return o.resolve(r(...)):catch(function(...)if s>0 then return o.retry(r,s-1,
unpack(t,1,u))else return o.reject(...)end end)end function o.retryWithDelay(r,s
,t,...)assert(f(r),'Parameter #1 to Promise.retry must be a function')assert(
type(s)=='number','Parameter #2 (times) to Promise.retry must be a number')
assert(type(t)=='number',
'Parameter #3 (seconds) to Promise.retry must be a number')local u,v={...},
select('#',...)return o.resolve(r(...)):catch(function(...)if s>0 then o.delay(t
):await()return o.retryWithDelay(r,s-1,t,unpack(u,1,v))else return o.reject(...)
end end)end function o.fromEvent(r,s)s=s or function()return true end return o.
_new(debug.traceback(nil,2),function(t,u,v)local w,x=false local function y()x:
Disconnect()x=nil end x=r:Connect(function(...)local z=s(...)if z==true then t(
...)if x then y()else w=true end elseif type(z)~='boolean'then error
'Promise.fromEvent predicate should always return a boolean'end end)if w and x
then return y()end v(y)end)end function o.onUnhandledRejection(r)table.insert(o.
_unhandledRejectionCallbacks,r)return function()local s=table.find(o.
_unhandledRejectionCallbacks,r)if s then table.remove(o.
_unhandledRejectionCallbacks,s)end end end return o end)()end},{{1,2,{'promise'}
}},'0.4.2','Utilities Plus',string,task,setmetatable,error,next,table,unpack,
coroutine,script,type,require,pcall,tostring,tonumber,_VERSION local v,w,x,y,z,A
,B=k.insert,k.remove,k.freeze or function(v)return v end,m.wrap,f.sub,f.match,f.
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