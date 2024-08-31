document.addEventListener('DOMContentLoaded', function () {
    const heritageList = document.getElementById('heritage-list');

    const heritageSites = [
        { imageUrl: 'images/1.jpg', name: 'Ancient Citadel of Eldoria', history:'Built over five centuries ago by the Eldorian Empire, the citadel served as a seat of power and a center for art, science, and diplomacy. It witnessed numerous battles and witnessed the rise and fall of empires.', description: 'The Ancient Citadel of Eldoria stands as a testament to the architectural brilliance of a bygone era. Its towering walls and intricate carvings depict the rich cultural tapestry of Eldoria.' },
        { imageUrl: 'images/2.jpg', name: 'Enchanting Gardens of Serenity', history:'Originally designed as a royal retreat in the 18th century, the gardens became a symbol of serenity and beauty. They were opened to the public in the early 20th century, becoming a cherished cultural landmark.', description: 'The Enchanting Gardens of Serenity offer a peaceful escape, adorned with vibrant flowers, cascading waterfalls, and meticulously manicured landscapes.' },
        { imageUrl: 'images/3.jpg', name: 'Mystic Temple of Lumaria', history:'Built in the 12th century by the followers of Lumaria, the temple served as a center for spiritual enlightenment. It has survived centuries, with pilgrims seeking solace and enlightenment within its hallowed halls.' , description: 'The Mystic Temple of Lumaria is renowned for its mystical aura, intricate sculptures, and sacred ambiance that captivates visitors.' },
        { imageUrl: 'images/4.jpg', name: 'Whimsical Clock Tower of Luminara', history:'Constructed in the 19th century as a symbol of civic pride, the clock tower served both functional and ornamental purposes. Its chimes echo through the city, marking the passage of time.', description: 'The Whimsical Clock Tower of Luminara is a charming masterpiece adorned with colorful tiles, whimsical sculptures, and a mesmerizing clock mechanism.' },
        { imageUrl: 'images/5.jpg', name: 'Floating Gardens of Aetheria', history:'Crafted by ancient sorcerers seeking harmony between nature and magic, the gardens have been a symbol of Aetherian magic for centuries. They are carefully tended by skilled gardeners and enchanters.' , description: 'The Floating Gardens of Aetheria hover above the ground, suspended by intricate magic-infused platforms, creating a surreal and breathtaking landscape.' },
        { imageUrl: 'images/6.jpg', name: 'Majestic Castle of Valoria', history:"Constructed in the 14th century as a fortress against invasions, the castle evolved into a royal residence. It has witnessed royal celebrations, political intrigues, and has been a silent witness to the region's history.", description: 'The Majestic Castle of Valoria stands atop a rugged cliff, boasting imposing towers, grand halls, and panoramic views of the surrounding landscapes.' },
        { imageUrl: 'images/7.jpg', name: 'Ancient Observatory of Astralis', history:"Built by early astronomers in the 16th century, the observatory played a crucial role in mapping the stars and predicting celestial events. It remains a testament to humanity's quest for understanding the cosmos", description: 'The Ancient Observatory of Astralis is an astronomical marvel adorned with celestial motifs, giant telescopes, and intricate astrolabes.' },
        { imageUrl: 'images/8.jpg', name: 'Whispering Ruins of Eclipsia', history:'Believed to have been a thriving city in antiquity, Eclipsia succumbed to natural disasters. The ruins are shrouded in mystery, with whispered legends of a once-great civilization.', description: 'The Whispering Ruins of Eclipsia are a haunting landscape of ancient columns, broken statues, and mysterious inscriptions, echoing with tales of a forgotten civilization.' },
        { imageUrl: 'images/9.jpg', name: 'Serpentine Caves of Mystara', history:'Carved by ancient civilizations as both a refuge and a ceremonial space, the caves served as a mystical haven. Today, they are explored by adventurers and archaeologists seeking the secrets of the underground realm.', description: 'The Serpentine Caves of Mystara wind through subterranean chambers, adorned with luminescent crystals, stalactites, and underground rivers.' },
        { imageUrl: 'images/10.jpg', name: 'Ethereal Bridge of Tranquility', history:'Constructed by skilled artisans in the 17th century, the bridge was designed to harmonize with nature. It has been a symbol of peaceful coexistence and a favorite spot for poets, artists, and nature enthusiasts.', description: 'The Ethereal Bridge of Tranquility spans a crystal-clear river, creating a harmonious connection between two lush landscapes.' }
    ];

    function createHeritageButton(site, index) {
        const button = document.createElement('button');
        button.className = "heritage-item";
        button.innerHTML = `
        <img src="${site.imageUrl}" alt="Heritage Site ${index + 1}" class="heritage-image">
        <div class="heritage-details">
            <p class="heritage-name">${site.name}</p>
            <a href="${site.imageUrl}" class="heritage-link" target="_blank">Learn more</a>
        </div>
        `
        // button.innerHTML = `<img src="${site.imageUrl}" alt="Heritage Site ${index + 1}">`;
        button.addEventListener('click', function () {
            window.location.href = `heritage-site.html?site=${index + 1}`;
        });
        return button;
    }

    heritageSites.forEach((site, index) => {
        heritageList.appendChild(createHeritageButton(site, index));
    });
});
