










local a=loadstring(game:HttpGetAsync"https://raw.githubusercontent.com/Adi0nt/Utilities-Plus/refs/heads/main/scripts/promise.luau")()


local b,





c,

d,
e=setmetatable({},{__tostring=function()return"LinkToInstanceIndex"end;}),"Object is a %* and as such expected `true?` for the method name and instead got %*. Traceback: %*","Object %* doesn't have method %*, are you sure you want to add it? Traceback: %*","Invalid argument #1 to 'Janitor:AddPromise' (Promise expected, got %* (%*)) Traceback: %*"

























































































local f={}
local g=f
f.ClassName="Janitor"
f.CurrentlyCleaning=true
f.SuppressInstanceReDestroy=false
(f).__index=f

local h,


















i=setmetatable({},{__mode="k"}),{
["function"]=true;
thread=true;
RBXScriptConnection="Disconnect";
}





function f.new()
return(setmetatable({
CurrentlyCleaning=false;
},f))
end








function f.Is(j)
return type(j)=="table"and getmetatable(j)==f
end










f.instanceof=f.Is


local function j(k,l)
local m=h[k]

if m then
local n=m[l]
if not n then
return k
end

local o=k[n]
if o then
if o==true then
if type(n)=="function"then
n()
else
local p
if coroutine.running()~=n then
p=pcall(function()
task.cancel(n)
end)
end

if not p then
local q=n
task.defer(function()
task.cancel(q)
end)
end
end
else
local p=n[o]
if p then
if k.SuppressInstanceReDestroy and o=="Destroy"and typeof(n)=="Instance"then
pcall(p,n)
else
p(n)
end
end
end

k[n]=nil
end

m[l]=nil
end

return k
end



local function k(l,m,n,o)
if o then
j(l,o)

local p=h[l]
if not p then
p={}
h[l]=p
end

p[o]=m
end

local p=typeof(m)
local q=n or i[p]or"Destroy"

if p=="function"or p=="thread"then
if q~=true then
warn(string.format(c,p,tostring(q),debug.traceback(nil,2)))
end
else
if not(m)[q]then
warn(
string.format(
d,
tostring(m),
tostring(q),
debug.traceback(nil,2)
)
)
end
end

l[m]=q
return m
end























































































g.Add=k





























function f:AddObject(l,m,n,...)
return k(self,l.new(...),m,n)
end































function f:AddPromise(l)
if not a then
return l
end

if not a.is(l)then
error(string.format(e,typeof(l),tostring(l),debug.traceback(nil,2)))
end

if l:getStatus()==a.Status.Started then
local m=newproxy(false)
local n=k(self,a.new(function(n,o,p)
if p(function()
l:cancel()
end)then
return
end

n(l)
end),"cancel",m)

n:finally(function()
j(self,m)
end)

return n
end

return l
end





























g.Remove=j

































function g:RemoveNoClean(l)
local m=h[self]

if m then
local n=m[l]
if n then
self[n]=nil
m[l]=nil
end
end

return self
end










































function f:RemoveList(...)
local l=h[self]
if l then
local m=select("#",...)
if m==1 then
return j(self,...)
end
if m==2 then
local n,o=...
j(self,n)
j(self,o)
return self
end
if m==3 then
local n,o,p=...
j(self,n)
j(self,o)
j(self,p)
return self
end

for n=1,m do
local o=select(n,...)
j(self,o)
end
end

return self
end










































function f:RemoveListNoClean(...)
local l=h[self]
if l then
local m=select("#",...)
if m==1 then
local n=...
local o=l[n]
if o then
self[o]=nil
l[n]=nil
end
return self
end
if m==2 then
local n,o=...
local p=l[n]
if p then
self[p]=nil
l[n]=nil
end
local q=l[o]
if q then
self[q]=nil
l[o]=nil
end
return self
end
if m==3 then
local n,o,p=...
local q=l[n]
if q then
self[q]=nil
l[n]=nil
end
local r=l[o]
if r then
self[r]=nil
l[o]=nil
end
local s=l[p]
if s then
self[s]=nil
l[p]=nil
end
return self
end

for n=1,m do

local o=select(n,...)
local p=l[o]
if p then
self[p]=nil
l[o]=nil
end
end
end

return self
end



























function f:Get(l)
local m=h[self]
return(m and{(m[l])}or{nil})[1]
end


























function f:GetAll()
local l=h[self]
return(l and{(table.freeze(table.clone(l)))}or{{}})[1]
end

local function l(m)
return function()
for n,o in next,m do
if n~="SuppressInstanceReDestroy"then
return n,o
end
end
end
end

local function m(n)
if not n.CurrentlyCleaning then
n.CurrentlyCleaning=nil

local o=l(n)
local p,q=o()

while p and q do
if q==true then
if type(p)=="function"then
p()
elseif type(p)=="thread"then
local r
if coroutine.running()~=p then
r=pcall(function()
task.cancel(p)
end)
end

if not r then
local s=p
task.defer(function()
task.cancel(s)
end)
end
end
else
local r=((p)[q])
if r then
if n.SuppressInstanceReDestroy and q=="Destroy"and typeof(p)=="Instance"then
pcall(r,p)
else
r(p)
end
end
end

n[p]=nil
p,q=o()
end

local r=h[n]
if r then
table.clear(r)
h[n]=nil
end

n.CurrentlyCleaning=false
end
end
























g.Cleanup=m









function f:Destroy()
m(self)
table.clear(self)
setmetatable(self,nil)
end

g.__call=m

local function n(o,p,q)
local r=(q and{(newproxy(false))}or{b})[1]

return k(o,p.Destroying:Connect(function()
m(o)
end),"Disconnect",r)
end

















































g.LinkToInstance=n;

(f).LegacyLinkToInstance=n







function f:LinkToInstances(...)
local o=f.new()
for p=1,select("#",...)do
local q=select(p,...)
if typeof(q)~="Instance"then
continue
end

o:Add(n(self,q,true),"Disconnect")
end

return o
end

function g:__tostring()
return"Janitor"
end

return f