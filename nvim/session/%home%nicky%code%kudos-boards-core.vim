let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/code/kudos-boards-core
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +20 kudos-user-service/src/responders/Client.responder.js
badd +22 .eslintrc.yaml
badd +30 kudos-boards-webfront/.eslintrc.yaml
badd +44 kudos-user-service/src/models/OrganisationMember.js
badd +62 kudos-user-service/src/models/Organisation.js
badd +1 kudos-user-service/src/models/OAuthToken.js
badd +48 kudos-user-service/src/models/GroupMember.js
badd +6 src/routes/Auth.routes.js
badd +116 kudos-user-service/src/controllers/User.auth.controller.js
badd +105 kudos-user-service-exports/src/User.controller.js
badd +45 api/local.rest
badd +29 __REST_response__
badd +23 src/controllers/User.controller.js
badd +424 node_modules/kudos-user-service-exports/dist/User.controller.js
badd +202 kudos-licence-service/src/controllers/UserLicence.controller.js
badd +18 kudos-licence-service/src/models/migrateLegacyClientLicences.js
badd +246 kudos-licence-service/src/models/OrgLicence.js
badd +37 kudos-licence-service/src/controllers/Subscription.controller.js
badd +9 kudos-licence-service/.env
badd +437 kudos-licence-service/src/controllers/OrgLicence.controller.js
badd +127 src/routes/Organisation.routes.js
badd +30 src/controllers/Organisation.controller.js
badd +348 kudos-user-service/src/controllers/Organisation.controller.js
badd +1 src/controllers/Licence.controller.js
badd +1 src/index.js
badd +28 kudos-licence-service/src/responders/OrgLicence.responder.js
badd +68 kudos-licence-service/src/controllers/ACL.controller.js
badd +1 kudos-user-service/src/responders/Organisation.responder.js
badd +92 src/routes/licence/Licence.organisation.routes.js
badd +1 src/controllers/Invites.controller.js
badd +1 src/routes/licence/index.js
badd +79 src/routes/licence/Licence.purchase.routes.js
badd +1349 kudos-licence-service/src/controllers/Purchase.controller.js
badd +2 kudos-licence-service/src/responders/Purchase.responder.js
badd +1 src/controllers/BoardUserPreference.controller.js
badd +2 src/routes/licence/Licence.stripe.routes.js
badd +133 node_modules/kudos-licence-service-exports/dist/Purchase.controller.js
badd +69 kudos-licence-service/src/config/index.js
badd +1 kudos-licence-service/node_modules/stripe/types/crypto/crypto.d.ts
badd +1 kudos-licence-service/node_modules/stripe/types/2020-08-27/Products.d.ts
badd +1 kudos-user-service/.dockerignore
badd +1 kudos-user-service/src/config/credentials.js
badd +1 kudos-licence-service/.env.default
badd +1 kudos-licence-service/src/controllers/User.controller.js
badd +1 kudos-licence-service/src/publishers/Licence.publisher.js
badd +2 src/live/subscribers/Auth.subscriber.ts
badd +1 src/live/subscribers/Nodes.subscriber.ts
badd +1 src/live/subscribers/Licence.subscriber.ts
badd +1 src/live/index.ts
badd +1 src/live/index.js
badd +1 src/live/socket.ts
badd +1 tsconfig.json
badd +1 nodemon.json
badd +1 .gitignore
badd +1 src/live/socket.types.js
badd +39 src/live/socket.types.ts
badd +44 kudos-user-service/.env
badd +117 src/routes/Boards.routes.js
badd +77 kudos-boards-service/src/controllers/Organisation.controller.js
badd +1 kudos-boards-service/src/controllers/Boards.controller.js
badd +57 kudos-boards-service/src/responders/Boards.responder.js
badd +11 kudos-boards-service/src/responders/Organisation.responder.js
badd +8 src/controllers/Boards.controller.js
badd +1102 kudos-boards-service/src/controllers/Members.controller.js
badd +1844 kudos-boards-service/src/controllers/Nodes.controller.js
badd +75 src/routes/LicenceAdmin.routes.js
badd +305 kudos-boards-service/src/models/Node.js
badd +1 src/routes/Nodes.routes.js
badd +12 kudos-boards-service/src/controllers/Licence.controller.js
badd +31 kudos-licence-service/src/models/UserLicence.js
badd +26 README.md
badd +2 kudos-licence-service/src/controllers/Stripe.controller.js
badd +1 boards-event-service/src/events/InviteToOrg/email.html.mustache
badd +7 boards-event-service/.env
badd +1 boards-event-service/.env.default
badd +1 boards-event-service/src/events/Commented/email.html.mustache
badd +21 boards-event-service/strings/missing_translations/ca.json
badd +1 src/routes/Webhooks.no.auth.routes.js
badd +41 boards-event-service/src/models/QueueItem.js
badd +96 src/controllers/LicenceAdmin.controller.js
badd +15 kudos-user-service/src/responders/User.responder.js
badd +761 kudos-user-service/src/controllers/User.controller.js
badd +238 kudos-user-service/src/models/User.js
badd +11 kudos-user-service/src/models/Client.js
badd +2 kudos-provider-service/src/api/connections/_core/index.js
badd +1 kudos-provider-service/src/api/_base/index.js
badd +10 kudos-provider-service/src/api/_base/Base.js
badd +11 kudos-provider-service/src/api/connections/on-prem/index.js
badd +6 kudos-provider-service/src/responders/index.js
badd +6 kudos-provider-service/src/responders/Provider.responder.js
badd +65 kudos-provider-service/src/controllers/Provider.service.js
badd +161 kudos-provider-service/src/api/msgraph/Files.js
badd +3 kudos-provider-service/src/api/auth0/index.js
badd +10 kudos-provider-service/src/api/auth0/Auth0.js
badd +12 kudos-provider-service/src/api/connections/collab/index.js
badd +16 kudos-provider-service/src/api/connections/smartcloud/index.js
badd +3 kudos-provider-service/src/api/domino/index.js
badd +6 kudos-provider-service/src/api/domino/Domino.js
badd +3 kudos-provider-service/src/api/msgraph/index.js
badd +9 kudos-provider-service/src/api/msgraph/MSGraph.js
badd +3 kudos-provider-service/src/api/slack/index.js
badd +8 kudos-provider-service/src/api/slack/Slack.js
badd +217 kudos-user-service/src/controllers/Client.controller.js
badd +150 kudos-user-service/src/config/index.js
badd +3 kudos-user-service/src/config/provider/index.js
badd +34 kudos-user-service/src/config/provider/ConnectionsOAuth.js
badd +14 kudos-user-service/src/config/provider/CollabOAuth.js
badd +5 kudos-user-service/src/migration.js
badd +1 kudos-user-service-exports/.git
badd +6 kudos-boards-service/.env
badd +2 .env
argglobal
%argdel
edit src/index.js
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt .env
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 2 - ((1 * winheight(0) + 40) / 81)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("kudos-boards-service/src/controllers/Boards.controller.js", ":p")) | buffer kudos-boards-service/src/controllers/Boards.controller.js | else | edit kudos-boards-service/src/controllers/Boards.controller.js | endif
if &buftype ==# 'terminal'
  silent file kudos-boards-service/src/controllers/Boards.controller.js
endif
balt kudos-boards-service/src/controllers/Organisation.controller.js
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1002 - ((59 * winheight(0) + 40) / 81)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1002
normal! 0
wincmd w
2wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
