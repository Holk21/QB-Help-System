
let HELP = null;
let SHOW_WELCOME = false;
let WELCOME = null;
let TOKEN = null;

function setActiveTab(tabName){
  document.querySelectorAll('.tab-btn').forEach(btn=>{
    btn.classList.toggle('active', btn.dataset.tab===tabName);
  });
}

function openExternal(url){
  if(!url) return;
  try {
    // Preferred: FiveM NUI native to open in the user's default browser
    if (typeof window.invokeNative === "function") {
      window.invokeNative('openUrl', url);
      return;
    }
  } catch(e){}
  // Fallback: attempt normal window open (may be blocked in NUI)
  try {
    const a = document.createElement('a');
    a.href = url;
    a.target = '_blank';
    a.rel = 'noopener';
    document.body.appendChild(a);
    a.click();
    a.remove();
  } catch(e){}
}

function attachLinkHandlers(){
  const discord = document.getElementById('discordLink');
  const website = document.getElementById('websiteLink');

  if (discord) {
    discord.addEventListener('click', (e)=>{
      e.preventDefault();
      if (WELCOME && WELCOME.discord) openExternal(WELCOME.discord);
    });
  }
  if (website) {
    website.addEventListener('click', (e)=>{
      e.preventDefault();
      if (WELCOME && WELCOME.website) openExternal(WELCOME.website);
    });
  }
}

function renderWelcome(){
  if(!WELCOME){ return renderTab('Player'); }
  setActiveTab('Welcome');
  const w = document.getElementById('welcome');
  const cards = document.getElementById('cards');
  w.classList.remove('hidden');
  cards.classList.add('hidden');

  const title = document.getElementById('welcomeTitle');
  const sub = document.getElementById('welcomeSub');
  const bullets = document.getElementById('welcomeBullets');
  const img = document.getElementById('welcomeImage');
  const linksWrap = document.getElementById('welcomeLinks');
  const discord = document.getElementById('discordLink');
  const website = document.getElementById('websiteLink');

  title.textContent = WELCOME.title || 'Welcome';
  sub.textContent = WELCOME.subtitle || '';
  bullets.innerHTML = '';
  (WELCOME.bullets || []).forEach(b=>{
    const li = document.createElement('li');
    li.textContent = b;
    bullets.appendChild(li);
  });
  if(WELCOME.image && WELCOME.image.length>0){
    img.src = WELCOME.image;
    img.classList.remove('hidden');
  } else {
    img.classList.add('hidden');
  }

  let hasLink = false;
  if(WELCOME.discord && WELCOME.discord.length>0){
    discord.href = '#';
    discord.classList.remove('hidden');
    hasLink = true;
  } else {
    discord.classList.add('hidden');
  }
  if(WELCOME.website && WELCOME.website.length>0){
    website.href = '#';
    website.classList.remove('hidden');
    hasLink = true;
  } else {
    website.classList.add('hidden');
  }
  linksWrap.classList.toggle('hidden', !hasLink);

  // ensure handlers are attached (idempotent to add more than once)
  attachLinkHandlers();
}

function renderTab(tabName){
  if(tabName==='Welcome'){ return renderWelcome(); }
  if(!HELP) return;
  setActiveTab(tabName);
  const list = HELP[tabName] || [];
  const cards = document.getElementById('cards');
  const welcome = document.getElementById('welcome');
  welcome.classList.add('hidden');
  cards.classList.remove('hidden');
  cards.innerHTML = '';
  list.forEach(item=>{
    const div = document.createElement('div');
    div.className = 'card';
    const h3 = document.createElement('h3');
    h3.textContent = item.title || 'Untitled';
    const p = document.createElement('p');
    p.className = 'badge';
    p.textContent = item.desc || '';
    const cmd = document.createElement('div');
    cmd.className = 'command';
    cmd.textContent = (item.command && String(item.command).trim().length>0) ? item.command : '—';
    div.appendChild(h3);
    div.appendChild(p);
    div.appendChild(cmd);
    cards.appendChild(div);
  });
}

function openUI(cfg){
  HELP = cfg.Help || {};
  SHOW_WELCOME = !!cfg.ShowWelcomeTab;
  WELCOME = cfg.Welcome || null;

  document.body.style.display = 'block';
  document.getElementById('tablet').classList.remove('hidden');

  const welcomeTab = document.getElementById('welcomeTab');
  if(SHOW_WELCOME){
    welcomeTab.classList.remove('hidden');
    renderWelcome();
  } else {
    welcomeTab.classList.add('hidden');
    renderTab('Player');
  }
}

function closeUI(){
  document.getElementById('tablet').classList.add('hidden');
  document.body.style.display = 'none';
  setTimeout(()=>{
    document.getElementById('tablet').classList.add('hidden');
    document.body.style.display = 'none';
  }, 25);
  try {
    fetch(`https://${GetParentResourceName()}/close`, {
      method:'POST',
      headers:{'Content-Type':'application/json'},
      body:'{}'
    });
  } catch(e){}
}

window.addEventListener('message', (event)=>{
  const data = event.data || {};
  if(data.ns !== 'qb-help') return;
  if(!data.token) return;
  if(TOKEN === null){
    TOKEN = data.token;
  }
  if(data.token !== TOKEN) return;

  if(data.action === 'open'){
    openUI(data.config || {});
  } else if (data.action === 'toggle'){
    if(data.show) {
      document.body.style.display = 'block';
      document.getElementById('tablet').classList.remove('hidden');
    } else {
      document.getElementById('tablet').classList.add('hidden');
      document.body.style.display = 'none';
    }
  } else if (data.action === 'status'){
    const info = data.info || {};
    const elTime = document.getElementById('welcomeTime');
    const elDate = document.getElementById('welcomeDate');
    const elPlayers = document.getElementById('welcomePlayers');
    if(elTime) elTime.textContent = info.time || '--:--:--';
    if(elDate) elDate.textContent = info.date || '--/--/----';
    if(elPlayers) elPlayers.textContent = (info.players != null ? info.players : '0');
  }
});

document.getElementById('closeBtn').addEventListener('click', ()=>{
  closeUI();
});

document.querySelectorAll('.tab-btn').forEach(btn=>{
  btn.addEventListener('click', ()=>renderTab(btn.dataset.tab));
});

window.addEventListener('keydown', (e)=>{
  const block = [' ', 'ArrowUp','ArrowDown','ArrowLeft','ArrowRight','w','a','s','d','W','A','S','D'];
  if(block.includes(e.key)){
    e.preventDefault();
    e.stopPropagation();
  }
});

window.addEventListener('keyup', (e)=>{
  if(e.key === 'Escape'){
    closeUI();
  }
});
