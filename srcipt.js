// script.js
// Lightweight interactivity for the portfolio
(() => {
  // data captured from your public profile & model context (editable)
  const meta = {
    name: 'Kazi Rifat Al Muin',
    location: 'Khulna, Bangladesh',
    email: 'kazirifatalmuin246@gmail.com',
    github: 'https://github.com/KaziRifatAlMuin',
    codeforces: 'https://codeforces.com/profile/KaziRifatAlMuin',
    cfRating: 1475,
    solved: 1000,
    year: '3rd year, KUET CSE',
    repos: [
      {title:'Online-Judges',desc:'Collection of integrations & tools for online judges',tag:'cp',link:'https://github.com/KaziRifatAlMuin/Online-Judges'},
      {title:'CSE-Academic',desc:'Academic resources and notes',tag:'academic',link:'https://github.com/KaziRifatAlMuin/CSE-Academic'},
      {title:'Digital Clock (Logisim)',desc:'A digital clock built for coursework',tag:'web',link:'#'},
    ]
  }

  // populate profile links
  const links = document.getElementById('profileLinks');
  links.innerHTML = `
    <a href="${meta.codeforces}" target="_blank">Codeforces</a>
    <a href="${meta.github}" target="_blank">GitHub</a>
    <a href="https://www.linkedin.com/in/kazi-rifat-al-muin" target="_blank">LinkedIn</a>
  `;

  // set CF rating
  document.getElementById('cfRating').textContent = meta.cfRating;

  // populate projects
  const projRoot = document.getElementById('projectsList');
  function renderProjects(filter='all'){
    projRoot.innerHTML='';
    meta.repos.filter(p=>filter==='all'||p.tag===filter).forEach(p=>{
      const el = document.createElement('div');
      el.className='proj';
      el.innerHTML = `<div><h4>${p.title}</h4><div class="muted">${p.desc}</div></div><div style="display:flex;gap:8px;align-items:center"><a class="cta" href="${p.link}" target="_blank">Open</a></div>`;
      projRoot.appendChild(el);
    })
  }
  renderProjects();
  document.getElementById('projFilter').addEventListener('change', e=>renderProjects(e.target.value));

  // theme toggle
  const themeT = document.getElementById('themeToggle');
  themeT.addEventListener('click',()=>{
    document.documentElement.style.setProperty('--bg', document.documentElement.style.getPropertyValue('--bg')==='#ffffff' ? '#0f1724' : '#ffffff');
    // simple inversion — tweak as needed
  })

  // download CV (generates a small text CV on the fly)
  document.getElementById('downloadCV').addEventListener('click',()=>{
    const text = `CV - ${meta.name}\nEmail: ${meta.email}\nLocation: ${meta.location}\nCF rating: ${meta.cfRating}\nGitHub: ${meta.github}`;
    const blob = new Blob([text],{type:'text/plain'});
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a'); a.href = url; a.download = 'CV-Rifat.txt'; document.body.appendChild(a); a.click(); a.remove(); URL.revokeObjectURL(url);
  });

  // contact form submit handled by PHP; we also provide AJAX fallback
  const form = document.getElementById('contactForm');
  const result = document.getElementById('formResult');
  form.addEventListener('submit', async (e)=>{
    e.preventDefault();
    const data = new FormData(form);
    try{
      const res = await fetch(form.action,{method:'POST',body:data});
      const txt = await res.text();
      result.textContent = 'Message sent — thank you!';
    }catch(err){
      result.textContent = 'Could not send via AJAX — submitting the form normally.';
      form.submit();
    }
  });

})();

// End of scripts.js