desc 'Seed Courses'
task seed_courses: :environment do
  courses =
  [
    ['Art of the Masters',
      ["Michelangelo, Leonardo da Vinci, Sandro Botticelli",
      "Winslow Homer, Claude Monet, John Singer Sargent",
      "Georgia O’Keefe, Jose’ Clemente Orozco",
      "Pablo Picasso, Jackson Pollock",
      "Joseph Mallard William Turner, Henri Matisse",
      "Mary Cassatt, Paul Gauguin"]],
    ['Biography',
      ["Autobiography",
      "Autobiography, continued",
      "Biography",
      "Biography, continued"]],
    ['Captivities',
      ["Lady Justice, Prejudice, Equality & Justice",
      "Bullies, Juvenile Crime, Physical Disability, Families, Government/Business/Health",
      "Governments, War, Poverty",
      "The Brain, Emotions, Substance Abuse, Zoos",
      "Captives, Inside the Walls, The Crime, Release"]],
    ['Creative Language',
      ["Language & Creativity, Non-fiction, Spelling & Grammar",
      "Language & Creativity, Fiction, Spelling & Grammar",
      "Language & Creativity, Poetry, Spelling & Grammar",
      "Fiction, Non-fiction, Spelling & Grammar",
      "Fiction, Poetry, Spelling & Grammar",
      "Writing, Writing Assignments for Others"]],
    ['Dogs',
      ["Dogs",
      "Intelligence",
      "Working Dogs",
      "Dogs & Humans"]],
    ['Drama Club I',
      ["Cast and Set",
      "Characterization and Dialogue",
      "Foreshadowing and Comedy",
      "Comedy and Mystery",
      "Comedy and Role Reversal",
      "True Stories",
      "Imaginary Friends",
      "Art and Drama"]],
    ['Drama Club II',
      ["Writing An Original Play"]],
    ['Drawing From the Inside Out',
      ["Introduction",
      "Seeing With A Lover’s Eye: Contour Drawing",
      "Abstraction",
      "The Magic of Line",
      "Learning From Sketching",
      "A Tool Bag",
      "Falling In Love"]],
    #'Exercise & Relaxation',
    ['Families',
      ["Family, Television Shows, Story",
        "Family, Musicals, Story",
        "Family, Movies, Story",
        "Family, Songs, Story",
        "Families, Poems, Story"]],
    ['Gardening',
      ["What is a 'Garden'?",
        "Container Gardens, Pink Flamingos, and Busch Gardens",
        "Flowers, Weeds, and the Garden State",
        "Herbs",
        "Trees",
        "Fruits and Vegetables",
        "Japanese Gardens"]],
    ['Greek Mythology',
      ["The Immortal Gods",
        "Atlas, Prometheus, Pandora, Achilles, Arachne",
        "Perseus & Medusa, Poseidon, Midas, Theseus, Daedalus & Icarus, Athena",
        "Demeter & Persephone, Zeus, The Fates, Typhon, Hermes, Atalanta",
        "The Underworld, Aeneas, Helios & Phaeton, Hercules",
        "Halcyon, Orpheus & Eurydice, Pyramus & Thisbe, Chrion, Argus, Janus"]],
    ['Health',
      ["Exercising, Ligaments & Joints, Pro Sports, Health Club",
        "Muscles, Gravity, Health Club",
        "Injury & Pain, Relaxation, Health Club",
        "Endurance, Trigger Point Therapy, Nutrition, Health Club"]],
    ['Histories',
      ["Introduction",
        "Stories of Revolution, Jazz",
        "Ancient Egypt, History of Writing",
        "Post World War I America, Musicals",
        "Vaccination, Mail"]],
    ['Journalism Club',
      ["Unit 1","Unit 2","Unit 3","Unit 4","Unit 5","Unit 6","Unit 7"]],
    ['Logic & Puzzles',
      ["Roles", "Transformations", "Grouping"]],
    ['Marine Biology',
      ["Marine Environments",
        "Marine Mammals",
        "Sharks",
        "Strange Creatures of the Sea",
        "Aquatic Birds"]],
    ['Numbers Game',
      ["Numbers, Ordering & Writing Numbers, Numbers & Associations",
        "Palindromic Numbers, Math Jeopardy, Inverse Processes",
        "Multiplication, Rate, Sections, Area",
        "Exponents, Order of Operations, Perimeter"]],
    ['Philosophy',
      ["Introduction, Branches of Philosophy",
        "Metaphysics, Epistemology, Ethics",
        "Utilitarianism, Education, Aesthetics",
        "Philosophers of Color, Women Philosophers",
        "Eastern Philosophers",
        "This & That"]],
    ['Poetry Club I',
      ["Introduction, Writing and Critiquing Poems, The Poetry of Carl Sandburg",
        "Writing and Critiquing Poems, The Poetry of Maya Angelou",
        "Writing and Critiquing Poems, The Poetry of Wallace Stevens",
        "Writing and Critiquing Poems, The Poetry of Robert Frost",
        "Writing Original Poems, Critiquing Poems by Prisoners",
        "Writing Original Poems, Critiquing More Poems by Prisoners",
        "Writing and Reflecting on Your Original Poems"]],
    ['Poetry Club II',
      ["Poems by Prisoners, Writing Original Poems",
        "Poems by Carl Sandburg, Writing original Poems",
        "More Poems by Prisoners, Writing Original Poems",
        "Poems by Mary Oliver & Meredith Davies Hadaway, Writing Original Poems",
        "Poems from the book This Art: Poems About Poetry, Writing Original Poems",
        "Poems by William Stafford, Writing Original Poems",
        "Poems by Richard Aldridge, Writing Original Poems"]],
    ['Precision Drawing',
      ["Introduction Pt 1",
        "Introduction Pt 2",
        "Contours & Crawling",
        "Establishing Location",
        "The Self Portrait",
        "Making Shadows",
        "Aerial and Linear Perspective",
        "Landscape"]],
    ['Sampler',
      ["To The Stars",
        "Stormy Weather",
        "Lets Go For a Ride",
        "Potatoes",
        "Music",
        "Fellow Students"]],
    ['Short Story Club I',
      ["Dog Star by Arthur C. Clarke, Writing an Original Short Story, Course Guidelines",
        "To Build a Fire by Jack London, Writing a Second Original Short Story",
        "The Secret Goldfish by David Means, Writing a Third Original Short Story",
        "The Upturned Face by Stephen Crane, Writing a Fourth Original Short Story",
        "The Magic Shop by H.G. Wells, Writing a Fifth Original Short Story",
        "The Lottery by Shirley Jackson, Writing a Sixth Original Short Story"]],
    ['Short Story Club II',
      ["Regret, by Kate Chopin; Writing a Seventh Original Short Story",
        "Now I Lay Me, by Ernest Hemingway; Writing an Eighth Original Short Story",
        "The Departure of Emma Inch, by James Thurber; Writing a Ninth Original Short Story",
        "The Necklace, by Guy de Maupassant; Writing a Tenth Original Short Story",
        "Over the River & Through the Woods, by John O’Hara; Writing an Eleventh Original Short Story",
        "The Overcoat, by James Thurber; Writing a Twelfth Original Short Story"]],
    ['Sports',
      ["Money, Role Models, Women In Sports, Individual Sports, You & Sports",
        "Baseball, Football, Basketball",
        "Round Objects; Wheels, Tracks, and Water; Your Turn",
        "Amateur Athletics"]],
    ['Travel',
      ["North America (Maine and Arizona)",
        "Europe (England and France)",
        "Asia (China and Nepal)",
        "Australia and New Zealand",
        "South America (Peru) and Africa (Timbuktu)"]],
    ['Science Sampler',
      ["Astronomy",
        "Physics",
        "Chemistry",
        "Geology",
        "Biology"]],
    ['Environmental Issues',
      ["Background & History",
        "Climate Change",
        "The Oceans",
        "Land Use and Biodiversity",
        "Fresh Water and Energy"]]
  ]
  courses.each do |course|
    Course.create!(title: course[0], sub_courses: course[1])
  end
end