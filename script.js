document.addEventListener('DOMContentLoaded', () => {
    const btn = document.getElementById('cta-btn');
    
    btn.addEventListener('click', () => {
        alert('Welcome to Antigravity Console!');
        // Could redirect to a login page or scroll down
    });

    console.log('Antigravity Systems Loaded.');
});
