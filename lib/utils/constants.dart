class AppConstants {
  static const String APP_TITLE = 'ابزار هوش مصنوعی';

  /// home screen const
  static const String SPEECH_TO_TEXT = 'گفتگو به متن';
  static const String TEXT_TO_SPEECH = 'متن به گفتگو';
  static const String IMAGE_GENERATOR = 'تولید عکس';
  static const String CHAT_BOT = 'ربات چت';
  static const String PREVIOUS_REQUESTS = 'درخواست های قبلی';
  static const String SUGGESTS = 'پیشنهادها';
}


/// List of AI Prompts
final List<String> aiPrompts = [
  // 🏞️ Nature Prompts
  "Generate a high-resolution image of a sunrise over a snowy mountain range.",
  "Create a realistic waterfall flowing through a dense forest in autumn.",
  "Visualize a desert oasis with crystal-clear water and palm trees at sunset.",
  "Illustrate a thunderstorm over a field of lavender with dramatic lighting.",
  "Generate an image of a secluded beach with turquoise waters and white sand.",
  "Visualize a serene lake surrounded by autumn trees reflecting in the water.",
  "Create a detailed image of a tropical rainforest with exotic birds flying.",
  "Generate a close-up of a blooming cherry blossom tree in spring.",
  "Illustrate a panoramic view of a canyon during golden hour.",
  "Visualize a calm river flowing through a meadow with wildflowers.",

  // 🏙️ Architecture Prompts
  "Design a futuristic city skyline with towering glass buildings and flying vehicles.",
  "Visualize an ancient Roman coliseum with crowds of people in traditional clothing.",
  "Create a high-detail render of a Japanese temple surrounded by cherry blossoms.",
  "Generate an image of a cozy cabin in the woods during winter with smoke from the chimney.",
  "Illustrate a medieval castle atop a mountain with fog rolling through the valleys.",
  "Design a modern glass skyscraper reflecting the sunset.",
  "Visualize a rustic village with cobblestone streets in autumn.",
  "Create an image of a floating city above the clouds.",
  "Illustrate a grand cathedral interior with stained glass windows.",
  "Generate an aerial view of a sprawling futuristic metropolis at night.",

  // 🎨 Art & Abstract Prompts
  "Generate an abstract representation of human emotions using vibrant colors.",
  "Create a surreal landscape with floating islands and waterfalls flowing into the sky.",
  "Illustrate a steampunk-inspired airship flying over Victorian-era London.",
  "Visualize a galaxy-themed painting with stars, nebulas, and swirling lights.",
  "Create a digital artwork of a cyberpunk city with neon lights and holograms.",
  "Generate a colorful fractal pattern with intricate details.",
  "Illustrate a dreamlike scene with melting clocks and floating objects.",
  "Visualize a fusion of nature and technology in an abstract composition.",
  "Create an expressionist painting of a stormy sea with bold brush strokes.",
  "Generate a minimalist black-and-white geometric design.",

  // 🚀 Technology & Futuristic Prompts
  "Generate a futuristic robot designed for medical assistance in a hospital setting.",
  "Visualize a space colony on Mars with sustainable architecture and advanced technology.",
  "Create a high-tech control room with holographic screens and interactive AI assistants.",
  "Illustrate a self-driving electric car on a smart highway with augmented reality signs.",
  "Generate a concept design for wearable augmented reality glasses in a city environment.",
  "Visualize a sleek drone flying over a smart city at night.",
  "Create an image of a cybernetic human with glowing implants.",
  "Illustrate a futuristic underwater research station with robotic arms.",
  "Generate a high-tech exoskeleton suit for industrial workers.",
  "Visualize a space elevator connecting Earth to orbit.",

  // 🐾 Animals & Wildlife Prompts
  "Create a lifelike portrait of a lion in its natural habitat during golden hour.",
  "Generate an image of dolphins swimming in crystal-clear ocean waters.",
  "Visualize a rare white tiger resting in a dense jungle under moonlight.",
  "Illustrate a colorful parrot perched on a tropical tree branch with detailed feathers.",
  "Generate a scene of elephants walking through the African savannah at sunset.",
  "Create an underwater scene of a coral reef teeming with marine life.",
  "Visualize a snowy owl in flight during a winter night.",
  "Illustrate a wolf pack running through a forest in early morning fog.",
  "Generate a close-up image of a butterfly on a flower petal.",
  "Create a scene of penguins sliding on ice in Antarctica.",

  // 🍲 Food & Culinary Prompts
  "Visualize a gourmet breakfast setup with pancakes, fresh fruits, and coffee.",
  "Create a high-resolution image of a traditional Italian pizza fresh out of the oven.",
  "Generate a luxurious dessert table with chocolate fondue and various pastries.",
  "Illustrate a seafood platter with lobster, shrimp, and oysters on a wooden table.",
  "Visualize a cup of cappuccino with latte art in a cozy café setting.",
  "Create a colorful salad bowl with fresh vegetables and herbs.",
  "Generate an image of a chef preparing sushi in a traditional Japanese kitchen.",
  "Visualize a rustic bread loaf fresh from the oven on a wooden board.",
  "Illustrate a festive holiday feast with roasted turkey and side dishes.",
  "Generate a close-up of a melting chocolate cake with strawberries.",

  // ✨ Fantasy & Mythology Prompts
  "Create a magical forest with glowing plants and mythical creatures under moonlight.",
  "Visualize a dragon flying over a medieval village during a sunset battle.",
  "Illustrate a fantasy kingdom with floating castles and enchanted rivers.",
  "Generate an image of a sorcerer casting spells with glowing runes around him.",
  "Visualize a portal opening to another dimension with vibrant cosmic energy.",
  "Create a scene of a unicorn drinking from a crystal-clear lake.",
  "Generate a mythical phoenix rising from fiery ashes.",
  "Illustrate an enchanted library filled with ancient spell books and floating candles.",
  "Visualize a dark elf warrior in an ancient underground city.",
  "Create a magical waterfall that flows with glowing liquid light.",

  // 📚 Historical & Cultural Prompts
  "Generate a scene of an ancient Egyptian market bustling with merchants and travelers.",
  "Illustrate a Viking ship sailing through icy waters with warriors on deck.",
  "Create an image of a Persian palace with intricate tile work and lush gardens.",
  "Visualize a traditional Indian festival with vibrant colors and joyous celebrations.",
  "Generate an image of a medieval knight in full armor standing before a castle.",
  "Create a renaissance painter working on a large canvas in a bright studio.",
  "Visualize a traditional African tribal dance in colorful costumes.",
  "Illustrate a samurai in full armor under cherry blossom trees.",
  "Generate a scene from the American Wild West with cowboys and horses.",
  "Visualize a grand medieval banquet hall filled with nobles and minstrels.",

  // 🎥 Movie & Cinematic Prompts
  "Create a cinematic scene of a futuristic chase through a neon-lit city.",
  "Visualize a dramatic sunset on a wild west desert showdown.",
  "Generate a sci-fi space battle between starships near a colorful nebula.",
  "Illustrate a noir detective in a rain-soaked alley with moody lighting.",
  "Create an epic fantasy battle scene with armies clashing on a vast field.",
  "Visualize a romantic picnic under cherry blossom trees in spring.",
  "Generate a horror scene in an abandoned haunted mansion at night.",
  "Illustrate a superhero flying over a modern city skyline at dusk.",
  "Create a thrilling car race on a mountainous road with dust clouds.",
  "Visualize a secret agent breaking into a high-security facility.",

  // 🌌 Space & Astronomy Prompts
  "Generate a detailed image of the surface of Mars with rovers exploring.",
  "Visualize a stunning spiral galaxy with billions of stars and cosmic dust.",
  "Create an image of astronauts walking on the moon during a sunrise.",
  "Illustrate a nebula with bright, colorful gases and star formations.",
  "Generate a futuristic space station orbiting a blue planet.",
  "Visualize a black hole bending light from nearby stars.",
  "Create an artistic rendering of the Milky Way seen from a desert.",
  "Generate a comet streaking across a dark night sky.",
  "Illustrate the rings of Saturn with a spacecraft flying close by.",
  "Visualize a space telescope capturing images of distant galaxies.",

  // 🌍 Environmental & Climate Prompts
  "Create an image showing the effects of climate change on glaciers.",
  "Visualize a city powered entirely by renewable energy with solar panels.",
  "Generate a scene of a forest being replanted after a wildfire.",
  "Illustrate ocean pollution with floating plastics and marine animals.",
  "Create a futuristic eco-friendly vehicle driving through green landscapes.",
  "Visualize urban rooftop gardens on skyscrapers in a busy city.",
  "Generate an image of wind turbines on rolling hills at sunset.",
  "Illustrate a polar bear and cubs navigating melting ice caps.",
  "Create a vibrant coral reef restoration project underwater.",
  "Visualize a community cleaning a polluted river together."
];
