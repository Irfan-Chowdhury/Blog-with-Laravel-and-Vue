-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2020 at 08:22 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_vuejs_superblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(39, 'Technology', '2020-03-31 12:04:05', '2020-03-31 12:04:05'),
(40, 'Fruit', '2020-03-31 12:13:34', '2020-03-31 12:14:33'),
(41, 'Vehicle', '2020-03-31 12:13:54', '2020-03-31 12:13:54');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2014_10_12_000000_create_users_table', 1),
(22, '2014_10_12_100000_create_password_resets_table', 1),
(23, '2020_02_03_154239_create_categories_table', 1),
(24, '2020_02_03_154947_create_comments_table', 1),
(25, '2020_02_03_155044_create_posts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `comment_id`, `title`, `description`, `photo`, `created_at`, `updated_at`) VALUES
(33, 11, 39, NULL, 'Machine Learning', 'Machine learning tasks are classified into several broad categories. In supervised learning, the algorithm builds a mathematical model from a set of data that contains both the inputs and the desired outputs. For example, if the task were determining whether an image contained a certain object, the training data for a supervised learning algorithm would include images with and without that object (the input), and each image would have a label (the output) designating whether it contained the object. In special cases, the input may be only partially available, or restricted to special feedback.[clarification needed] Semi-supervised learning algorithms develop mathematical models from incomplete training data, where a portion of the sample input doesn\'t have labels.\n\nClassification algorithms and regression algorithms are types of supervised learning. Classification algorithms are used when the outputs are restricted to a limited set of values. For a classification algorithm that filters emails, the input would be an incoming email, and the output would be the name of the folder in which to file the email. For an algorithm that identifies spam emails, the output would be the prediction of either \"spam\" or \"not spam\", represented by the Boolean values true and false. Regression algorithms are named for their continuous outputs, meaning they may have any value within a range. Examples of a continuous value are the temperature, length, or price of an object.\n\nIn unsupervised learning, the algorithm builds a mathematical model from a set of data that contains only inputs and no desired output labels. Unsupervised learning algorithms are used to find structure in the data, like grouping or clustering of data points. Unsupervised learning can discover patterns in the data, and can group the inputs into categories, as in feature learning. Dimensionality reduction is the process of reducing the number of \"features\", or inputs, in a set of data.\n\nActive learning algorithms access the desired outputs (training labels) for a limited set of inputs based on a budget and optimize the choice of inputs for which it will acquire training labels. When used interactively, these can be presented to a human user for labeling. Reinforcement learning algorithms are given feedback in the form of positive or negative reinforcement in a dynamic environment and are used in autonomous vehicles or in learning to play a game against a human opponent.[2]:3 Other specialized algorithms in machine learning include topic modeling, where the computer program is given a set of natural language documents and finds other documents that cover similar topics. Machine learning algorithms can be used to find the unobservable probability density function in density estimation problems. Meta learning algorithms learn their own inductive bias based on previous experience. In developmental robotics, robot learning algorithms generate their own sequences of learning experiences, also known as a curriculum, to cumulatively acquire new skills through self-guided exploration and social interaction with humans. These robots use guidance mechanisms such as active learning, maturation, motor synergies, and imitation.[clarification needed]', '1585677971.jpeg', '2020-03-31 12:06:13', '2020-03-31 12:06:13'),
(34, 11, 39, NULL, 'Artificial Intelligence', 'Main articles: History of artificial intelligence and Timeline of artificial intelligence\n\nSilver didrachma from Crete depicting Talos, an ancient mythical automaton with artificial intelligence\nThought-capable artificial beings appeared as storytelling devices in antiquity,[26] and have been common in fiction, as in Mary Shelley\'s Frankenstein or Karel Čapek\'s R.U.R. (Rossum\'s Universal Robots).[27] These characters and their fates raised many of the same issues now discussed in the ethics of artificial intelligence.[21]\n\nThe study of mechanical or \"formal\" reasoning began with philosophers and mathematicians in antiquity. The study of mathematical logic led directly to Alan Turing\'s theory of computation, which suggested that a machine, by shuffling symbols as simple as \"0\" and \"1\", could simulate any conceivable act of mathematical deduction. This insight, that digital computers can simulate any process of formal reasoning, is known as the Church–Turing thesis.[28] Along with concurrent discoveries in neurobiology, information theory and cybernetics, this led researchers to consider the possibility of building an electronic brain. Turing proposed changing the question from whether a machine was intelligent, to \"whether or not it is possible for machinery to show intelligent behaviour\".[29] The first work that is now generally recognized as AI was McCullouch and Pitts\' 1943 formal design for Turing-complete \"artificial neurons\".[30]\n\nThe field of AI research was born at a workshop at Dartmouth College in 1956,[31] where the term \"Artificial Intelligence\" was coined by John McCarthy to distinguish the field from cybernetics and escape the influence of the cyberneticist Norbert Wiener.[32] Attendees Allen Newell (CMU), Herbert Simon (CMU), John McCarthy (MIT), Marvin Minsky (MIT) and Arthur Samuel (IBM) became the founders and leaders of AI research.[33] They and their students produced programs that the press described as \"astonishing\":[34] computers were learning checkers strategies (c. 1954)[35] (and by 1959 were reportedly playing better than the average human),[36] solving word problems in algebra, proving logical theorems (Logic Theorist, first run c. 1956) and speaking English.[37] By the middle of the 1960s, research in the U.S. was heavily funded by the Department of Defense[38] and laboratories had been established around the world.[39] AI\'s founders were optimistic about the future: Herbert Simon predicted, \"machines will be capable, within twenty years, of doing any work a man can do\". Marvin Minsky agreed, writing, \"within a generation ... the problem of creating \'artificial intelligence\' will substantially be solved\".[9]\n\nThey failed to recognize the difficulty of some of the remaining tasks. Progress slowed and in 1974, in response to the criticism of Sir James Lighthill[40] and ongoing pressure from the US Congress to fund more productive projects, both the U.S. and British governments cut off exploratory research in AI. The next few years would later be called an \"AI winter\",[11] a period when obtaining funding for AI projects was difficult.\n\nIn the early 1980s, AI research was revived by the commercial success of expert systems,[41] a form of AI program that simulated the knowledge and analytical skills of human experts. By 1985, the market for AI had reached over a billion dollars. At the same time, Japan\'s fifth generation computer project inspired the U.S and British governments to restore funding for academic research.[10] However, beginning with the collapse of the Lisp Machine market in 1987, AI once again fell into disrepute, and a second, longer-lasting hiatus began.[12]\n\nThe development of metal–oxide–semiconductor (MOS) very-large-scale integration (VLSI), in the form of complementary MOS (CMOS) transistor technology, enabled the development of practical artificial neural network (ANN) technology in the 1980s. A landmark publication in the field was the 1989 book Analog VLSI Implementation of Neural Systems by Carver A. Mead and Mohammed Ismail.[42]\n\nIn the late 1990s and early 21st century, AI began to be used for logistics, data mining, medical diagnosis and other areas.[25] The success was due to increasing computational power (see Moore\'s law and transistor count), greater emphasis on solving specific problems, new ties between AI and other fields (such as statistics, economics and mathematics), and a commitment by researchers to mathematical methods and scientific standards.[43] Deep Blue became the first computer chess-playing system to beat a reigning world chess champion, Garry Kasparov, on 11 May 1997.[44]\n\nIn 2011, a Jeopardy! quiz show exhibition match, IBM\'s question answering system, Watson, defeated the two greatest Jeopardy! champions, Brad Rutter and Ken Jennings, by a significant margin.[45] Faster computers, algorithmic improvements, and access to large amounts of data enabled advances in machine learning and perception; data-hungry deep learning methods started to dominate accuracy benchmarks around 2012.[46] The Kinect, which provides a 3D body–motion interface for the Xbox 360 and the Xbox One, uses algorithms that emerged from lengthy AI research[47] as do intelligent personal assistants in smartphones.[48] In March 2016, AlphaGo won 4 out of 5 games of Go in a match with Go champion Lee Sedol, becoming the first computer Go-playing system to beat a professional Go player without handicaps.[8][49] In the 2017 Future of Go Summit, AlphaGo won a three-game match with Ke Jie,[50] who at the time continuously held the world No. 1 ranking for two years.[51][52] This marked the completion of a significant milestone in the development of Artificial Intelligence as Go is a relatively complex game, more so than Chess.\n\nAccording to Bloomberg\'s Jack Clark, 2015 was a landmark year for artificial intelligence, with the number of software projects that use AI Google increased from a \"sporadic usage\" in 2012 to more than 2,700 projects. Clark also presents factual data indicating the improvements of AI since 2012 supported by lower error rates in image processing tasks.[53] He attributes this to an increase in affordable neural networks, due to a rise in cloud computing infrastructure and to an increase in research tools and datasets.[13] Other cited examples include Microsoft\'s development of a Skype system that can automatically translate from one language to another and Facebook\'s system that can describe images to blind people.[53] In a 2017 survey, one in five companies reported they had \"incorporated AI in some offerings or processes\".[54][55] Around 2016, China greatly accelerated its government funding; given its large supply of data and its rapidly increasing research output, some observers believe it may be on track to becoming an \"AI superpower\".[56][57] However, it has been acknowledged that reports regarding artificial intelligence have tended to be exaggerated.[58][59][60]', '1585678292.jpeg', '2020-03-31 12:11:32', '2020-03-31 12:11:32'),
(35, 11, 39, NULL, 'Data Science', 'The term \"data science\" has appeared in various contexts over the past thirty years but did not become an established term until recently. In an early usage, it was used as a substitute for computer science by Peter Naur in 1960. Naur later introduced the term \"datalogy\".[7] In 1974, Naur published Concise Survey of Computer Methods, which freely used the term data science in its survey of the contemporary data processing methods that are used in a wide range of applications.\n\nThe modern definition of \"data science\" was first sketched during the second Japanese-French statistics symposium organized at the University of Montpellier II (France) in 1992.[8] The attendees acknowledged the emergence of a new discipline with a specific focus on data from various origins, dimensions, types and structures. They shaped the contour of this new science based on established concepts and principles of statistics and data analysis with the extensive use of the increasing power of computer tools.\n\nIn 1996, members of the International Federation of Classification Societies (IFCS) met in Kobe for their biennial conference. Here, for the first time, the term data science is included in the title of the conference (\"Data Science, classification, and related methods\"),[9] after the term was introduced in a roundtable discussion by Chikio Hayashi.[3]\n\nIn November 1997, C.F. Jeff Wu gave the inaugural lecture entitled \"Statistics = Data Science?\"[10] for his appointment to the H. C. Carver Professorship at the University of Michigan.[11] In this lecture, he characterized statistical work as a trilogy of data collection, data modeling and analysis, and decision making. In his conclusion, he initiated the modern, non-computer science, usage of the term \"data science\" and advocated that statistics be renamed data science and statisticians data scientists.[10] Later, he presented his lecture entitled \"Statistics = Data Science?\" as the first of his 1998 P.C. Mahalanobis Memorial Lectures.[12] These lectures honor Prasanta Chandra Mahalanobis, an Indian scientist and statistician and founder of the Indian Statistical Institute.\n\nIn 2001, William S. Cleveland introduced data science as an independent discipline, extending the field of statistics to incorporate \"advances in computing with data\" in his article \"Data Science: An Action Plan for Expanding the Technical Areas of the Field of Statistics,\" which was published in Volume 69, No. 1, of the April 2001 edition of the International Statistical Review / Revue Internationale de Statistique.[13] In his report, Cleveland establishes six technical areas which he believed to encompass the field of data science: multidisciplinary investigations, models and methods for data, computing with data, pedagogy, tool evaluation, and theory.\n\nIn April 2002, the International Council for Science (ICSU): Committee on Data for Science and Technology (CODATA)[14] started the Data Science Journal,[15] a publication focused on issues such as the description of data systems, their publication on the internet, applications and legal issues.[16] Shortly thereafter, in January 2003, Columbia University began publishing The Journal of Data Science,[17] which provided a platform for all data workers to present their views and exchange ideas. The journal was largely devoted to the application of statistical methods and quantitative research. In 2005, The National Science Board published \"Long-lived Digital Data Collections: Enabling Research and Education in the 21st Century\" defining data scientists as \"the information and computer scientists, database and software and programmers, disciplinary experts, curators and expert annotators, librarians, archivists, and others, who are crucial to the successful management of a digital data collection\" whose primary activity is to \"conduct creative inquiry and analysis.\"[18]\n\nAround 2007,[citation needed] Turing award winner Jim Gray envisioned \"data-driven science\" as a \"fourth paradigm\" of science that uses the computational analysis of large data as primary scientific method[4][5] and \"to have a world in which all of the science literature is online, all of the science data is online, and they interoperate with each other.\"[19]\n\nIn the 2012 Harvard Business Review article \"Data Scientist: The Sexiest Job of the 21st Century\",[20] DJ Patil claims to have coined this term in 2008 with Jeff Hammerbacher to define their jobs at LinkedIn and Facebook, respectively. He asserts that a data scientist is \"a new breed\", and that a \"shortage of data scientists is becoming a serious constraint in some sectors\", but describes a much more business-oriented role.\n\nIn 2013, the IEEE Task Force on Data Science and Advanced Analytics[21] was launched. In 2013, the first \"European Conference on Data Analysis (ECDA)\" was organised in Luxembourg, establishing the European Association for Data Science (EuADS). The first international conference: IEEE International Conference on Data Science and Advanced Analytics was launched in 2014.[22] In 2014, General Assembly launched student-paid bootcamp and The Data Incubator launched a competitive free data science fellowship.[23] In 2014, the American Statistical Association section on Statistical Learning and Data Mining renamed its journal to \"Statistical Analysis and Data Mining: The ASA Data Science Journal\" and in 2016 changed its section name to \"Statistical Learning and Data Science\".[24] In 2015, the International Journal on Data Science and Analytics[25] was launched by Springer to publish original work on data science and big data analytics. In September 2015 the Gesellschaft für Klassifikation (GfKl) added to the name of the Society \"Data Science Society\" at the third ECDA conference at the University of Essex, Colchester, UK.', '1585678359.jpeg', '2020-03-31 12:12:39', '2020-03-31 12:12:39'),
(36, 11, 40, NULL, 'Apple', 'The apple is a deciduous tree, generally standing 6 to 15 ft (1.8 to 4.6 m) tall in cultivation and up to 30 ft (9.1 m) in the wild. When cultivated, the size, shape and branch density are determined by rootstock selection and trimming method. The leaves are alternately arranged dark green-colored simple ovals with serrated margins and slightly downy undersides.[5]\n\n\nApple blossom\nBlossoms are produced in spring simultaneously with the budding of the leaves and are produced on spurs and some long shoots. The 3 to 4 cm (1.2 to 1.6 in) flowers are white with a pink tinge that gradually fades, five petaled, with an inflorescence consisting of a cyme with 4–6 flowers. The central flower of the inflorescence is called the \"king bloom\"; it opens first and can develop a larger fruit.[5][6]\n\nThe fruit matures in late summer or autumn, and cultivars exist in a wide range of sizes. Commercial growers aim to produce an apple that is 2 3⁄4 to 3 1⁄4 in (7.0 to 8.3 cm) in diameter, due to market preference. Some consumers, especially those in Japan, prefer a larger apple, while apples below 2 1⁄4 in (5.7 cm) are generally used for making juice and have little fresh market value. The skin of ripe apples is generally red, yellow, green, pink, or russetted, though many bi- or tri-colored cultivars may be found.[7] The skin may also be wholly or partly russeted i.e. rough and brown. The skin is covered in a protective layer of epicuticular wax.[8] The exocarp (flesh) is generally pale yellowish-white,[7] though pink or yellow exocarps also occur.\n\nWild ancestors\nMain article: Malus sieversii\nThe original wild ancestor of Malus domestica was Malus sieversii, found growing wild in the mountains of Central Asia in southern Kazakhstan, Kyrgyzstan, Tajikistan, and Xinjiang, China.[5][9] Cultivation of the species, most likely beginning on the forested flanks of the Tian Shan mountains, progressed over a long period of time and permitted secondary introgression of genes from other species into the open-pollinated seeds. Significant exchange with Malus sylvestris, the crabapple, resulted in current populations of apples being more related to crabapples than to the more morphologically similar progenitor Malus sieversii. In strains without recent admixture the contribution of the latter predominates.[10][11][12]\n\nGenome\nIn 2010, an Italian-led consortium announced they had sequenced the complete genome of the apple in collaboration with horticultural genomicists at Washington State University,[13] using \'Golden Delicious\'.[14] It had about 57,000 genes, the highest number of any plant genome studied to date[15] and more genes than the human genome (about 30,000).[16] This new understanding of the apple genome will help scientists identify genes and gene variants that contribute to resistance to disease and drought, and other desirable characteristics. Understanding the genes behind these characteristics will help scientists perform more knowledgeable selective breeding. The genome sequence also provided proof that Malus sieversii was the wild ancestor of the domestic apple—an issue that had been long-debated in the scientific community.[13]\n\nHistory\ncolor photograph of a hand holding a red apple\nWild Malus sieversii apple in Kazakhstan\nOpen book 01.png	\n\"Wild Apples\"\nby Henry David Thoreau\nRead by Kevin S for LibriVox\nMENU0:00\nAudio 01:01:35 (full text)\nProblems playing this file? See media help.\nMalus sieversii is recognized as a major progenitor species to the cultivated apple, and is morphologically similar. Due to the genetic variability in Central Asia, this region is generally considered the center of origin for apples.[17] The apple is thought to have been domesticated 4000-10000 years ago in the Tian Shan Mountains, and then to have travelled along the Silk Road to Europe, with hybridization and introgression of wild crabapples from Siberia (M. baccata (L.) Borkh.), Caucasus (M. orientalis Uglitz.), and Europe (M. sylvestris Mill.). Only the M. sieversii trees growing on the western side of Tian Shan Mountains contributed genetically to the domesticated apple, not the isolated population on the eastern side.[18]\n\nChinese soft apples, such as M. asiatica and M. prunifolia, have been cultivated as dessert apples for more than 2000 years in China. These are thought to be hybrids between M. baccata and M. sieversii in Kazakhstan.[18]\n\nAmong the traits selected for by human growers are size, fruit acidity, color, firmness, and soluble sugar. Unusually for domesticated fruits, the wild M. sieversii origin is only slightly smaller than the modern domesticated apple.[18]\n\nAt the Sammardenchia-Cueis site near Udine in Northeastern Italy, seeds from some form of apples have been found in material carbon dated to around 4000 BCE.[19] Genetic analysis has not yet been successfully used to determine whether such ancient apples were wild Malus Sylvestris or Malus Domesticus containing Malus sieversii ancestry.[20] It is generally also hard to distinguish in the archeological record between foraged wild apples and apple plantations.\n\nThere is indirect evidence of apple cultivation in the third millenium BCE in the Middle East. There was substantial apple production in the European classical antiquity, and grafting was certainly known then.[20] Grafting is an essential part of modern domesticated apple production, to be able to propagate the best cultivars; it is unclear when apple tree grafting was invented.[20]\n\nWinter apples, picked in late autumn and stored just above freezing, have been an important food in Asia and Europe for millennia.[21] Of the many Old World plants that the Spanish introduced to Chiloé Archipelago in the 16th century, apple trees became particularly well adapted.[22] Apples were introduced to North America by colonists in the 17th century,[5] and the first apple orchard on the North American continent was planted in Boston by Reverend William Blaxton in 1625.[23] The only apples native to North America are crab apples, which were once called \"common apples\".[24] Apple cultivars brought as seed from Europe were spread along Native American trade routes, as well as being cultivated on colonial farms. An 1845 United States apples nursery catalogue sold 350 of the \"best\" cultivars, showing the proliferation of new North American cultivars by the early 19th century.[24] In the 20th century, irrigation projects in Eastern Washington began and allowed the development of the multibillion-dollar fruit industry, of which the apple is the leading product.[5]\n\nUntil the 20th century, farmers stored apples in frostproof cellars during the winter for their own use or for sale. Improved transportation of fresh apples by train and road replaced the necessity for storage.[25][26] Controlled atmosphere facilities are used to keep apples fresh year-round. Controlled atmosphere facilities use high humidity, low oxygen, and controlled carbon dioxide levels to maintain fruit freshness. They were first used in the United States in the 1960s.[27]', '1585678562.jpeg', '2020-03-31 12:16:02', '2020-03-31 12:16:02'),
(37, 11, 40, NULL, 'Mango', 'A mango is a juicy stone fruit (drupe) produced from numerous species of tropical trees belonging to the flowering plant genus Mangifera, cultivated mostly for their edible fruit.\n\nMost of these species are found in nature as wild mangoes. The genus belongs to the cashew family Anacardiaceae. Mangoes are native to South Asia,[1][2] from where the \"common mango\" or \"Indian mango\", Mangifera indica, has been distributed worldwide to become one of the most widely cultivated fruits in the tropics. Other Mangifera species (e.g. horse mango, Mangifera foetida) are grown on a more localized basis.\n\nWorldwide, there are several hundred cultivars of mango. Depending on the cultivar, mango fruit varies in size, shape, sweetness, skin color, and flesh color which may be pale yellow, gold, or orange.[1] Mango is the national fruit of India and Pakistan, and the national tree of Bangladesh.[3] It is the unofficial national fruit of the Philippines.[4].\n\nThe English word \"mango\" (plural \"mangoes\" or \"mangos\") originated from the Malayalam word māṅṅa (or mangga) via Dravidian-Tamil (mankay as man for mango tree and kay for fruit, or maangaay) during the spice trade period with South India in the 15th and 16th centuries.[5][6][7]\n\nThe earliest known reference to the cultivation of mangoes can be traced to India up to 2000BCE[8] Mango was brought to East Asia around 400–500 BCE, in the 15th century to the Philippines, and in the 16th century to Africa and Brazil by Portuguese explorers.[9] There have been several verified accounts and novels with references to the mango fruit in Indian Tamil literary works, the most prominent known reference to the mango fruit being to the 5th century saint Karaikkal Ammaiyar, where it is mentioned that she received a mango fruit as a boon from Lord Shiva, due to her devotion when her husband requested it, after providing alms one out of two mangoes given by her husband earlier to an Ascetic, disguised as Lord Shiva.[10]\n\nMango is mentioned by Hendrik van Rheede, the Dutch commander of the Malabar region in his 1678 book, Hortus Malabaricus, about plants having economic value.[11] When mangoes were first imported to the American colonies in the 17th century, they had to be pickled because of lack of refrigeration. Other fruits were also pickled and came to be called \"mangoes\", especially bell peppers, and in the 18th century, the word \"mango\" became a verb meaning \"to pickle\".[12]', '1585678661.jpeg', '2020-03-31 12:17:41', '2020-03-31 12:17:41'),
(38, 11, 41, NULL, 'Bike', 'Despite vast improvements in cycling infrastructure in many cities across the continent, the majority of North Americans still don’t bike to work. While the benefits of cycling to work are nearly innumerable, we managed to round them down to just ten so we wouldn’t run out of space on the Internet. From the Momentum Mag staff, here are our top 10 reasons to bike to work:\n\n1. Fun!\n\nBiking to work is fun, plain and simple. Many people look back wistfully on fond childhood memories of riding their bike around their neighborhood, wishing they could still be so carefree amid the rigors of working life. Biking to work allows you integrate that simple feeling of exhilaration into your daily grind. Observe your surroundings, listen to the birds and wave at passing cyclists as you ride. Soon enough, you’ll find yourself wishing your commute were longer.\n\n2. Fitness\n\nBiking to work is good for you. While the exact calories burned on a ride varies between each person, their speed, and the topography, cycling on average burns as many calories as jogging, with considerably fewer negative impacts on the joints. Cycling improves cardio-vascular and aerobic fitness, lowers blood pressure, boosts energy, builds muscle, and improves coordination. Sneaking the health benefits of biking into your daily commute is so easy it almost feels like cheating!\n\n3. Happiness\n\nBiking to work makes you happier. While most people would not identify sitting in traffic, navigating a congested city, or riding crowded public transit as activities that calm them down or make them happy, cycling to work can actually transform your daily commute into a moderate form of therapy. Numerous studies have shown that daily exercise can reduce stress, alleviate symptoms of depression, improve sleep patterns for individuals with insomnia, and reduce anxiety. Furthermore, exercising outdoors – both in urban and rural contexts – has been proven to boost self-confidence and improve overall mood.\n\n4. Brain-power\n\nBiking to work makes you smarter. While it may not turn you into an astrophysicist overnight, research has proven that moderate, daily exercise can prevent cognitive decline, sharpen memory and learning, and improve overall brain performance. So even if biking to work doesn’t turn you into a Rhodes Scholar, at the very least it will make you better at your job.\n\nRELATED\nA Study Finds Cyclists to Be Six Times Healthier than Other Commuters. Read here.\n\n5. Money\n\nBiking to work saves you money. Lots of money. In 2015, the average American household is forecast to spend $1,962 on gasoline and motor oil. Shockingly, that would be the lowest average fuel expenditure in the US since 2009! Add on vehicle maintenance, the occasional repair, insurance, and the skyrocketing cost of parking, and you have an average yearly cost of $9,000 USD just to own a standard sedan in America. Conversely, a brand new commuter bike retails at anywhere from $250-$1,500 USD depending on the brand, style, and components you’re after, with an average yearly maintenance cost of around $50 USD. Unless you want to maintain your bike yourself, then it’s close to free! One-off purchases of a lock and lights will run you about $60-$200 USD depending on the quality. So even if you went for the most expensive options in each case, you’re still looking at savings of around $7,050 USD in your first year, with savings of up to $9,000 each year after that. Not a bad deal!\n\n6. Money Again\n\nNot only does biking to work save you money, it saves everyone money. A 2011 cost-benefit analysis of biking investments in Portland, OR, by the Journal of Physical Activity and Health determined that Portland residents could save between $388 and $594 million in individual health care costs by 2040 because of the city’s increased investment in bike infrastructure. Add that to savings yielded by employers who invest in a company bike culture, the billions of dollars generated annually by the wider bike industry, and the economic benefits that strong bike communities bring to businesses, and you have yourself a solid financial case for hopping on a bicycle that even the most staunch defender of the automobile would have a hard time talking down.\n\n7. Fresh air\n\nFor you and others! The transportation sector accounts for nearly 30 percent of all US greenhouse gas emissions, with cars and trucks delivering nearly 1/5th of those emissions. While a solo driver in an average North American vehicle releases about 1.2 pounds of C02 per mile, the average cyclist releases only 0.7 grams through respiration. And while a bicycle’s life-cycle energy use including manufacturing and maintenance over a 15-year period is 60 kilojoules per Passenger Mile Traveled, the life-cycle energy use for a standard sedan clocks in at a whopping 4027 kilojoules/ PMT. That’s some serious energy savings with a seriously simple change.\n\n8. Convenience\n\nOne of the most common misconceptions about biking to work is that it’s inconvenient. But what’s more inconvenient than spending 10 minutes looking for parking every morning or getting stuck in an unexpected roadblock on the way? When you bike to work, finding parking is as easy as spotting the nearest pole, locking up, and walking away. Cyclists don’t get stuck in traffic jams and aren’t susceptible to the usual transit delays of driving or public transportation, making bike commuting as fast or faster than driving for most urban commutes. Panniers and cycling bags make carrying your work materials easy, and many workplaces are now including secure bike parking, showers, and other facilities to make things even easier for employees who cycle to work.\n\n9. Safety\n\nThe more cyclists there are on the roads, the safer they will be. A 2008 study from the University of New South Wales determined that biking safety is a virtuous cycle. As more people ride in a given city, the number of collisions between drivers and people riding bikes decreases in absolute terms in that city. And this is not simply because there are fewer cars. Driver behavior actually changes to include safer driving practices when the number of cyclists and pedestrians increases. Because the perception of the relative safety of cycling improves with a decrease in collisions, more people then begin riding bikes. Virtuous cycle!\n\n10.  Freedom\n\nFor most kids, the moment that they first lose the training wheels and go flying down the road on their bicycle feels like freedom. It is a defining moment of many happy childhoods. Then the teenage years roll around and the car comes to define a new sense of freedom. But after a few years and far too many hours wasted in traffic jams or circling a city block looking for parking, the car begins to feel more like a prison. Toss off the shackles and find that feeling of freedom again. Explore the city at your own pace, try a new route, stop for coffee on the way to work and check out a new neighborhood on your way home. Cycling opens up avenues, both literal and figurative, to see your city in a whole new way. It’s your community, go live in it!\n\nAre you ready to put pedal to pavement and commute by bike? Let us show you how to bike to work.', '1585678800.jpeg', '2020-03-31 12:20:01', '2020-03-31 12:20:01'),
(39, 11, 41, NULL, 'Car', 'Why do we use cars? The reason we use cars is for transportation. While we could install railways, trolley cars, subways, etc., we would rather choose cars as they are more convenient. Instead of having to wait for the 2:00 train or something like that, we can get in our car and drive out to the place without waiting for others. Not only that, but cars hive an added sense of security as you know that you are the only person in the car(or with people you choose to drive with) and not with a bunch of strangers. Also, cars create a new industry with many jobs. While railways and planes are often used for long distance traveling, cars are mostly for short distance with a couple long distance trips. This way, there are multiple industries used for transportation. Finally, cars are easier to add luxury features onto as all seats need them, not just a select amount that will have to be controlled.\n\nWe need cars simply for transportation. If we did hot have them then we would be forced to use horse drawn carriages again. People are always wanting to move around and go places and without automobiles then this would be much more difficult. You can always walk if you have the stamina or the time. Trains were invented so people could travel longer distances faster without the use of horses. The invention of the commercial airplane basically spelled the end of the train era in the 19th century. Our species has always needed to move supplies and commerce from place to place. This used to be done by river barges before the truck was invented. That is why towns and cities are located by large bodies of water. They had to get their stuff needed to live someway and river barges were the way to do it.\n\nThey\'re a useful and convenient mode of transportation. They also allow the creation of the suburb, as well as make it feasible to travel 1000 kilometers in a day, relatively cheaply.\n\nYou may know that Google is tracking you, but most people don\'t realize the extent of it. Luckily, there are simple steps you can take to dramatically reduce Google\'s tracking.\n\nBut first, what exactly are they tracking? Unlike searching on DuckDuckGo, when you search on Google, they keep your search history forever. That means they know every search you’ve ever done on Google. That alone is pretty scary, but it’s just the shallow end of the very deep pool of data that they try to collect on people.\n\nWhat most people don’t realize is that even if you don’t use any Google products directly, they’re still trying to discover as much as they can about you. Google trackers have been found on 75% of the top million websites. This means they\'re also trying to track most everywhere you go on the internet, trying to slurp up your browsing history!\n\nMost people also don’t know that Google runs most of the ads you see across the internet and in apps – you know those ones that follow you around everywhere? Yup, that’s Google, too. They aren’t really a search company anymore – they’re a tracking company. They are tracking as much as they can for these annoying and intrusive ads, including recording every time you see them, where you saw them, if you clicked on them, etc.\n\nBut even that’s not all…\n\nIf You Use Google Products\n\nIf you do use Google products, they track you even more. In addition to tracking everything you’ve ever searched for on Google (e.g. “weird rash”), Google also tracks every video you’ve ever watched on YouTube. Many people actually don’t know that Google owns YouTube; now you know.', '1585678908.jpeg', '2020-03-31 12:21:48', '2020-03-31 12:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Bernadine Cronin', 'luettgen.theodore@example.org', '2020-02-03 08:13:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rr40AocflG', '2020-02-03 08:13:06', '2020-02-03 08:13:06'),
(2, 'Adam Wyman', 'gemard@example.org', '2020-02-03 08:13:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'h3dObJYVuE', '2020-02-03 08:13:06', '2020-02-03 08:13:06'),
(3, 'Fannie White', 'aracely.hoeger@example.org', '2020-02-03 08:13:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rEmcVK6plI', '2020-02-03 08:13:06', '2020-02-03 08:13:06'),
(4, 'Immanuel Kozey', 'pete17@example.com', '2020-02-03 08:13:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7LY1KAV6Sx', '2020-02-03 08:13:06', '2020-02-03 08:13:06'),
(5, 'Mallie Oberbrunner', 'rogahn.christelle@example.net', '2020-02-03 08:13:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BVKqItwar9', '2020-02-03 08:13:06', '2020-02-03 08:13:06'),
(6, 'Dr. Stan Rosenbaum', 'eduardo.russel@example.org', '2020-02-03 08:13:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ngNHcxE2F8', '2020-02-03 08:13:06', '2020-02-03 08:13:06'),
(7, 'Miss Kara Smitham Sr.', 'monahan.ryleigh@example.net', '2020-02-03 08:13:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gJKJUsB5ow', '2020-02-03 08:13:06', '2020-02-03 08:13:06'),
(8, 'Russell Fisher', 'mokon@example.net', '2020-02-03 08:13:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KipNiGokHX', '2020-02-03 08:13:07', '2020-02-03 08:13:07'),
(9, 'Martina White V', 'providenci35@example.org', '2020-02-03 08:13:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '42ep5Ou4VC', '2020-02-03 08:13:07', '2020-02-03 08:13:07'),
(10, 'Dr. Odell Jaskolski DDS', 'mellie.macejkovic@example.com', '2020-02-03 08:13:06', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nZJEZtqjtK', '2020-02-03 08:13:07', '2020-02-03 08:13:07'),
(11, 'Irfan Chowdhury', 'irfanchowdhury@gmail.com', NULL, '$2y$10$mwsFEm4wWgf6b1cW2Vl4a./9W8M2Ye8Gr9.5FjwrMtrbZ.lGKH5tW', NULL, '2020-03-25 09:45:43', '2020-03-25 09:45:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_name_unique` (`category_name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
