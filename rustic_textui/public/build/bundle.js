(()=>{"use strict";function t(){}const e=t=>t;function n(t){return t()}function o(){return Object.create(null)}function r(t){t.forEach(n)}function s(t){return"function"==typeof t}function l(t,e){return t!=t?e==e:t!==e||t&&"object"==typeof t||"function"==typeof t}function i(t){return 0===Object.keys(t).length}const c="undefined"!=typeof window;let a=c?()=>window.performance.now():()=>Date.now(),u=c?t=>requestAnimationFrame(t):t;const d=new Set;function f(t){d.forEach((e=>{e.c(t)||(d.delete(e),e.f())})),0!==d.size&&u(f)}let h=!1;function p(t,e,n,o){for(;t<e;){const r=t+(e-t>>1);n(r)<=o?t=r+1:e=r}return t}function $(t,e){h?(function(t){if(t.hydrate_init)return;t.hydrate_init=!0;const e=t.childNodes,n=new Int32Array(e.length+1),o=new Int32Array(e.length);n[0]=-1;let r=0;for(let t=0;t<e.length;t++){const s=p(1,r+1,(t=>e[n[t]].claim_order),e[t].claim_order)-1;o[t]=n[s]+1;const l=s+1;n[l]=t,r=Math.max(l,r)}const s=[],l=[];let i=e.length-1;for(let t=n[r]+1;0!=t;t=o[t-1]){for(s.push(e[t-1]);i>=t;i--)l.push(e[i]);i--}for(;i>=0;i--)l.push(e[i]);s.reverse(),l.sort(((t,e)=>t.claim_order-e.claim_order));for(let e=0,n=0;e<l.length;e++){for(;n<s.length&&l[e].claim_order>=s[n].claim_order;)n++;const o=n<s.length?s[n]:null;t.insertBefore(l[e],o)}}(t),(void 0===t.actual_end_child||null!==t.actual_end_child&&t.actual_end_child.parentElement!==t)&&(t.actual_end_child=t.firstChild),e!==t.actual_end_child?t.insertBefore(e,t.actual_end_child):t.actual_end_child=e.nextSibling):e.parentNode!==t&&t.appendChild(e)}function m(t,e,n){h&&!n?$(t,e):(e.parentNode!==t||n&&e.nextSibling!==n)&&t.insertBefore(e,n||null)}function _(t){t.parentNode.removeChild(t)}function g(t){return document.createElement(t)}function y(t,e,n){null==n?t.removeAttribute(e):t.getAttribute(e)!==n&&t.setAttribute(e,n)}function b(t,e,n,o){t.style.setProperty(e,n,o?"important":"")}const v=new Set;let w,x=0;function k(t,e,n,o,r,s,l,i=0){const c=16.666/o;let a="{\n";for(let t=0;t<=1;t+=c){const o=e+(n-e)*s(t);a+=100*t+`%{${l(o,1-o)}}\n`}const u=a+`100% {${l(n,1-n)}}\n}`,d=`__svelte_${function(t){let e=5381,n=t.length;for(;n--;)e=(e<<5)-e^t.charCodeAt(n);return e>>>0}(u)}_${i}`,f=t.ownerDocument;v.add(f);const h=f.__svelte_stylesheet||(f.__svelte_stylesheet=f.head.appendChild(g("style")).sheet),p=f.__svelte_rules||(f.__svelte_rules={});p[d]||(p[d]=!0,h.insertRule(`@keyframes ${d} ${u}`,h.cssRules.length));const $=t.style.animation||"";return t.style.animation=`${$?`${$}, `:""}${d} ${o}ms linear ${r}ms 1 both`,x+=1,d}function E(t){w=t}const C=[],S=[],A=[],M=[],O=Promise.resolve();let T=!1;function L(t){A.push(t)}let N=!1;const j=new Set;function q(){if(!N){N=!0;do{for(let t=0;t<C.length;t+=1){const e=C[t];E(e),z(e.$$)}for(E(null),C.length=0;S.length;)S.pop()();for(let t=0;t<A.length;t+=1){const e=A[t];j.has(e)||(j.add(e),e())}A.length=0}while(C.length);for(;M.length;)M.pop()();T=!1,N=!1,j.clear()}}function z(t){if(null!==t.fragment){t.update(),r(t.before_update);const e=t.dirty;t.dirty=[-1],t.fragment&&t.fragment.p(t.ctx,e),t.after_update.forEach(L)}}let H;function P(t,e,n){t.dispatchEvent(function(t,e){const n=document.createEvent("CustomEvent");return n.initCustomEvent(t,!1,!1,e),n}(`${e?"intro":"outro"}${n}`))}const R=new Set;let B;function D(t,e){t&&t.i&&(R.delete(t),t.i(e))}function I(t,e,n,o){if(t&&t.o){if(R.has(t))return;R.add(t),B.c.push((()=>{R.delete(t),o&&(n&&t.d(1),o())})),t.o(e)}}const F={duration:0};function G(n,o,l,i){let c=o(n,l),h=i?0:1,p=null,$=null,m=null;function _(){m&&function(t,e){const n=(t.style.animation||"").split(", "),o=n.filter(e?t=>t.indexOf(e)<0:t=>-1===t.indexOf("__svelte")),r=n.length-o.length;r&&(t.style.animation=o.join(", "),x-=r,x||u((()=>{x||(v.forEach((t=>{const e=t.__svelte_stylesheet;let n=e.cssRules.length;for(;n--;)e.deleteRule(n);t.__svelte_rules={}})),v.clear())})))}(n,m)}function g(t,e){const n=t.b-h;return e*=Math.abs(n),{a:h,b:t.b,d:n,duration:e,start:t.start,end:t.start+e,group:t.group}}function y(o){const{delay:s=0,duration:l=300,easing:i=e,tick:y=t,css:b}=c||F,v={start:a()+s,b:o};o||(v.group=B,B.r+=1),p||$?$=v:(b&&(_(),m=k(n,h,o,l,s,i,b)),o&&y(0,1),p=g(v,l),L((()=>P(n,o,"start"))),function(t){let e;0===d.size&&u(f),new Promise((n=>{d.add(e={c:t,f:n})}))}((t=>{if($&&t>$.start&&(p=g($,l),$=null,P(n,p.b,"start"),b&&(_(),m=k(n,h,p.b,p.duration,0,i,c.css))),p)if(t>=p.end)y(h=p.b,1-h),P(n,p.b,"end"),$||(p.b?_():--p.group.r||r(p.group.c)),p=null;else if(t>=p.start){const e=t-p.start;h=p.a+p.d*i(e/p.duration),y(h,1-h)}return!(!p&&!$)})))}return{run(t){s(c)?(H||(H=Promise.resolve(),H.then((()=>{H=null}))),H).then((()=>{c=c(),y(t)})):y(t)},end(){_(),p=$=null}}}let J;function K(t,e){const n=t.$$;null!==n.fragment&&(r(n.on_destroy),n.fragment&&n.fragment.d(e),n.on_destroy=n.fragment=null,n.ctx=[])}function Q(e,l,i,c,a,u,d=[-1]){const f=w;E(e);const p=e.$$={fragment:null,ctx:null,props:u,update:t,not_equal:a,bound:o(),on_mount:[],on_destroy:[],on_disconnect:[],before_update:[],after_update:[],context:new Map(f?f.$$.context:l.context||[]),callbacks:o(),dirty:d,skip_bound:!1};let $=!1;if(p.ctx=i?i(e,l.props||{},((t,n,...o)=>{const r=o.length?o[0]:n;return p.ctx&&a(p.ctx[t],p.ctx[t]=r)&&(!p.skip_bound&&p.bound[t]&&p.bound[t](r),$&&function(t,e){-1===t.$$.dirty[0]&&(C.push(t),T||(T=!0,O.then(q)),t.$$.dirty.fill(0)),t.$$.dirty[e/31|0]|=1<<e%31}(e,t)),n})):[],p.update(),$=!0,r(p.before_update),p.fragment=!!c&&c(p.ctx),l.target){if(l.hydrate){h=!0;const t=(m=l.target,Array.from(m.childNodes));p.fragment&&p.fragment.l(t),t.forEach(_)}else p.fragment&&p.fragment.c();l.intro&&D(e.$$.fragment),function(t,e,o,l){const{fragment:i,on_mount:c,on_destroy:a,after_update:u}=t.$$;i&&i.m(e,o),l||L((()=>{const e=c.map(n).filter(s);a?a.push(...e):r(e),t.$$.on_mount=[]})),u.forEach(L)}(e,l.target,l.anchor,l.customElement),h=!1,q()}var m;E(f)}"undefined"!=typeof window?window:"undefined"!=typeof globalThis?globalThis:global,new Set(["allowfullscreen","allowpaymentrequest","async","autofocus","autoplay","checked","controls","default","defer","disabled","formnovalidate","hidden","ismap","loop","multiple","muted","nomodule","novalidate","open","playsinline","readonly","required","reversed","selected"]),"function"==typeof HTMLElement&&(J=class extends HTMLElement{constructor(){super(),this.attachShadow({mode:"open"})}connectedCallback(){const{on_mount:t}=this.$$;this.$$.on_disconnect=t.map(n).filter(s);for(const t in this.$$.slotted)this.appendChild(this.$$.slotted[t])}attributeChangedCallback(t,e,n){this[t]=n}disconnectedCallback(){r(this.$$.on_disconnect)}$destroy(){K(this,1),this.$destroy=t}$on(t,e){const n=this.$$.callbacks[t]||(this.$$.callbacks[t]=[]);return n.push(e),()=>{const t=n.indexOf(e);-1!==t&&n.splice(t,1)}}$set(t){this.$$set&&!i(t)&&(this.$$.skip_bound=!0,this.$$set(t),this.$$.skip_bound=!1)}});function U(t){const e=t-1;return e*e*e+1}function V(t,{delay:e=0,duration:n=400,easing:o=U,x:r=0,y:s=0,opacity:l=0}={}){const i=getComputedStyle(t),c=+i.opacity,a="none"===i.transform?"":i.transform,u=c*(1-l);return{delay:e,duration:n,easing:o,css:(t,e)=>`\n\t\t\ttransform: ${a} translate(${(1-t)*r}px, ${(1-t)*s}px);\n\t\t\topacity: ${c-u*e}`}}function W(t){let e,n,o,r;return{c(){e=g("div"),n=g("div"),y(n,"class","text svelte-18z17g9"),y(e,"class","container svelte-18z17g9"),b(e,"background-color",t[1])},m(o,s){m(o,e,s),$(e,n),n.innerHTML=t[0],r=!0},p(t,o){(!r||1&o)&&(n.innerHTML=t[0]),(!r||2&o)&&b(e,"background-color",t[1])},i(t){r||(L((()=>{o||(o=G(e,V,{x:-200,duration:500},!0)),o.run(1)})),r=!0)},o(t){o||(o=G(e,V,{x:-200,duration:500},!1)),o.run(0),r=!1},d(t){t&&_(e),t&&o&&o.end()}}}function X(t){let e,n,o=t[2]&&W(t);return{c(){e=g("main"),o&&o.c()},m(t,r){m(t,e,r),o&&o.m(e,null),n=!0},p(t,[n]){t[2]?o?(o.p(t,n),4&n&&D(o,1)):(o=W(t),o.c(),D(o,1),o.m(e,null)):o&&(B={r:0,c:[],p:B},I(o,1,1,(()=>{o=null})),B.r||r(B.c),B=B.p)},i(t){n||(D(o),n=!0)},o(t){I(o),n=!1},d(t){t&&_(e),o&&o.d()}}}function Y(t,e,n){let o,r,s=!1;return window.addEventListener("message",(function(t){let e=t.data;n(0,o=e.text),n(1,r=e.color),"show_ui"==e.type?(void 0===r&&n(1,r="rgb(52, 152, 219)"),n(2,s=!0)):"hide_ui"==e.type&&n(2,s=!1)})),[o,r,s]}new class extends class{$destroy(){K(this,1),this.$destroy=t}$on(t,e){const n=this.$$.callbacks[t]||(this.$$.callbacks[t]=[]);return n.push(e),()=>{const t=n.indexOf(e);-1!==t&&n.splice(t,1)}}$set(t){this.$$set&&!i(t)&&(this.$$.skip_bound=!0,this.$$set(t),this.$$.skip_bound=!1)}}{constructor(t){super(),Q(this,t,Y,X,l,{})}}({target:document.body})})();