let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/code/kudos-boards-core/kudos-boards-webfront
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 src/boards/Organisation/Huddle.jsx
badd +1 src/boards/Organisation/Groups.jsx
badd +1 .eslintrc.yaml
badd +2 package.json
badd +41 src/boards/Admin/LicenceDetails.jsx
badd +69 src/boards/Onboarding/Welcome.jsx
badd +55 src/boards/BoardsApp.js
badd +36 src/util/apiCaller.js
badd +54 src/micro/App.js
badd +21 src/components/RequestsBar.js
badd +45 src/boards/Onboarding/PlanSelection.jsx
badd +8 node_modules/@mui/styled-engine/StyledEngineProvider/StyledEngineProvider.d.ts
badd +15 node_modules/@mui/material/styles/ThemeProvider.d.ts
badd +33 src/boards/Onboarding/Welcome.module.scss
badd +94 src/boards/Node/NodeDialog.js
badd +14 src/boards/File/FilePreviewDialog.js
badd +24 src/boards/User/UserActions.js
badd +38 src/boards/Auth/AuthActions.js
badd +100 src/boards/Licence/LicenceAPI.js
badd +74 src/boards/Organisation/Plans.jsx
badd +24 src/boards/Organisation/People.jsx
badd +176 src/boards/Organisation/GroupDetailDialog.jsx
badd +28 src/boards/Organisation/PurchaseDialog.jsx
badd +38 src/boards/User/UserAPI.js
badd +106 src/boards/Admin/OrgDetails.js
badd +77 src/boards/Licence/Purchase/InputStep.jsx
badd +37 src/boards/Licence/Purchase/Checkout.jsx
badd +44 src/boards/Licence/components/HuddoPartner.jsx
badd +93 src/boards/Licence/LicenceActions.js
badd +42 src/boards/Organisation/PurchaseDialog.module.scss
badd +95 src/boards/Organisation/PurchaseDetails.jsx
badd +78 src/boards/Organisation/PurchaseConfirm.jsx
badd +24 src/util/popup.js
badd +264 src/boards/Provider/ConnectionsSSOHeader.js
badd +3 src/components/LoadingHuddo.jsx
badd +16 src/boards/Board/Timeline/Sidebar.js
badd +45 src/util/events.js
badd +154 src/boards/Node/components/RichTextEditor.js
badd +92 src/boards/Node/components/Header.js
badd +13 src/util/socket.js
badd +27 src/boards/Boards/BoardsLive.js
badd +20 src/micro/PurchaseOutcome/index.js
badd +1 src/micro/api/UserAPI.js
badd +1 src/micro/api/LicenceAPI.js
badd +1 src/micro/Search/SearchResult.js
badd +1 src/boards/Provider/ProviderHeader.js
badd +1 src/boards/Admin/QuoteDialog.jsx
badd +188 src/boards/Organisation/PlanDialog.jsx
badd +1 src/boards/Organisation/PlanDialog.module.scss
badd +1 src/boards/Licence/Purchase/StripePurchaseDialog.jsx
badd +7 src/boards/Licence/Purchase/ConfirmationStep.jsx
badd +26 src/boards/Organisation/util.js
badd +60 src/boards/Licence/Subscription/Subscription.jsx
badd +9 src/boards/Organisation/PlanCancelRestoreDialog.jsx
badd +1 src/boards/Board/Mindmap/TreeNode.js
badd +39 babel.config.js
badd +58 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Organisation/UserListItem.jsx
badd +79 src/boards/Admin/Organisation/OrgConfig.js
badd +61 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Organisation/Options.jsx
badd +19 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Organisation/./List.module.scss
badd +67 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Organisation/Overview.jsx
badd +130 ~/code/kudos-boards-core/kudos-boards-webfront/src/components/BoardDisplayTile.js
badd +163 src/components/BoardDisplayTile.scss
badd +71 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Organisation/./OrganisationAPI.js
badd +44 ~/code/kudos-boards-core/kudos-boards-webfront/strings/translations/ar.json
badd +93 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Organisation/Overview.module.scss
badd +52 src/components/CardIcons.js
badd +17 ~/code/kudos-boards-core/kudos-boards-webfront/src/components/UserAvatar.js
badd +54 src/components/UserImage.js
badd +11 src/components/UserLoader.js
badd +26 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Organisation/UsageBar.jsx
badd +5 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Organisation/UsageBar.module.scss
badd +32 src/util/providers/Teams.js
badd +25 ~/code/kudos-boards-core/kudos-boards-webfront/src/micro/CreateCard/CreateCardForm.js
badd +61 ~/code/kudos-boards-core/kudos-boards-webfront/src/micro/CreateCard/CreateCard.js
badd +56 ~/code/kudos-boards-core/kudos-boards-webfront/src/micro/provider/msgraph/OutlookController.js
badd +8 src/boards/BoardsAppInit.jsx
badd +32 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/BoardsAppActions.js
badd +17 ~/code/kudos-boards-core/kudos-boards-webfront/src/auth/AuthAPI.js
badd +25 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Core/Sidebar.js
badd +39 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Boards/Sidebar/NavDrawer.js
badd +29 src/boards/Core/BoardsHeader.js
badd +18 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/User/Tours.js
badd +12 src/micro/LinkedCards/LinkedCardList.module.scss
badd +38 src/boards/Core/BoardsHeader.module.scss
badd +40 src/App.scss
badd +1 src/components/HaileyDialog.jsx
badd +41 ~/code/kudos-boards-core/kudos-boards-webfront/src/components/HaileyDialog.module.scss
badd +173 ~/code/kudos-boards-core/kudos-boards-webfront/node_modules/react-joyride/types/index.d.ts
badd +1 ~/code/kudos-boards-core/kudos-boards-webfront/node_modules/react-joyride/es/index.js
badd +2 ~/code/kudos-boards-core/kudos-boards-webfront/yarn.lock
badd +16 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/User/./Tours.css
badd +345 src/util/tours.js
badd +168 src/boards/Board/Members/Members.jsx
badd +18 src/boards/Board/Sidebar/MemberList.js
badd +127 src/boards/Board/BoardView.jsx
badd +47 src/boards/Board/Kanban/Kanban.jsx
badd +13 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Board/Kanban/KanbanBoard.jsx
badd +39 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Board/useBoardStats.js
badd +50 src/boards/Node/NodeBuckets.js
badd +296 ~/code/kudos-boards-core/kudos-boards-webfront/src/util/node.js
badd +94 src/components/Dialogs.js
badd +64 ~/code/kudos-boards-core/kudos-boards-webfront/node_modules/react-scripts/lib/react-app.d.ts
badd +62 ~/code/kudos-boards-core/kudos-boards-webfront/node_modules/@mui/material/LinearProgress/LinearProgress.d.ts
badd +1 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Boards/Sidebar/NavDrawer.module.scss
badd +95 src/boards/Boards/BoardWizard/BoardWizard.js
badd +3 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Boards/BoardWizard/BoardDetailsStep.jsx
badd +29 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/User/useCloudOrgs.js
badd +574 ~/code/kudos-boards-core/kudos-boards-webfront/strings/default.json
badd +99 node_modules/@mui/material/SvgIcon/SvgIcon.d.ts
badd +45 ~/code/kudos-boards-core/kudos-boards-webfront/src/util/configGetter.js
badd +2 ~/code/kudos-boards-core/kudos-boards-webfront/.env.local
badd +1 ~/code/kudos-boards-core/kudos-boards-webfront/.env.development
badd +5 ~/code/kudos-boards-core/kudos-boards-webfront/.env.local.default
badd +45 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Boards/BoardWizard/BoardWizard.module.scss
badd +522 node_modules/@mui/icons-material/index.d.ts
badd +1 ~/code/kudos-boards-core/kudos-boards-webfront/src/util/lang.js
badd +1 ~/code/kudos-boards-core/kudos-boards-webfront/src/micro/components/AuthProvider.js
badd +41 ~/code/kudos-boards-core/kudos-boards-webfront/src/micro/components/UserHasNoOrgs.jsx
badd +34 ~/code/kudos-boards-core/kudos-boards-webfront/src/micro/components/AutoLogin.js
badd +7 ~/code/kudos-boards-core/kudos-boards-webfront/src/micro/components/UserFeedback.js
argglobal
%argdel
edit ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/User/Tours.js
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
exe 'vert 1resize ' . ((&columns * 157 + 158) / 316)
exe 'vert 2resize ' . ((&columns * 158 + 158) / 316)
argglobal
balt ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/User/useCloudOrgs.js
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
let s:l = 306 - ((56 * winheight(0) + 40) / 81)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 306
normal! 035|
wincmd w
argglobal
if bufexists(fnamemodify("~/code/kudos-boards-core/kudos-boards-webfront/src/micro/components/AuthProvider.js", ":p")) | buffer ~/code/kudos-boards-core/kudos-boards-webfront/src/micro/components/AuthProvider.js | else | edit ~/code/kudos-boards-core/kudos-boards-webfront/src/micro/components/AuthProvider.js | endif
if &buftype ==# 'terminal'
  silent file ~/code/kudos-boards-core/kudos-boards-webfront/src/micro/components/AuthProvider.js
endif
balt ~/code/kudos-boards-core/kudos-boards-webfront/src/micro/components/UserHasNoOrgs.jsx
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
let s:l = 43 - ((38 * winheight(0) + 40) / 81)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 43
normal! 028|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 157 + 158) / 316)
exe 'vert 2resize ' . ((&columns * 158 + 158) / 316)
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
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
