-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2024 at 06:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogforcoders`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `mes` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `mes`, `date`) VALUES
(1, 'Palkesh Prajapati', 'palkeshprajapati88@gmail.com', '8435152009', 'This is my Message', '2024-01-18 10:01:21'),
(33, 'Goofy geef', 'xofor72584@stypedia.com', ' +919977402718', 'Hy Jay Shri Ram', '2024-01-18 17:37:21'),
(34, 'Priyanka', 'dexavix481@armablog.com', ' +919977402718', 'AHY', '2024-01-25 13:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `subtitle` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `subtitle`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Stock', 'Let\'s learn about Stocks', 'first-post', 'Stocks (also capital stock, or sometimes interchangeably, shares) consist of all the shares[a] by which ownership of a corporation or company is divided.[1] A single share of the stock means fractional ownership of the corporation in proportion to the total number of shares. This typically entitles the shareholder (stockholder) to that fraction of the company\'s earnings, proceeds from liquidation of assets (after discharge of all senior claims such as secured and unsecured debt),[3] or voting power, often dividing these up in proportion to the amount of money each stockholder has invested. Not all stock is necessarily equal, as certain classes of stock may be issued, for example, without voting rights, with enhanced voting rights, or with a certain priority to receive profits or liquidation proceeds before or after other classes of shareholders.\n\nStock can be bought and sold privately or on stock exchanges. Such transactions are closely overseen by governments and regulatory bodies to prevent fraud, protect investors, and benefit the larger economy. The stocks are deposited with the depositories in the electronic format also known as Demat account. As new shares are issued by a company, the ownership and rights of existing shareholders are diluted in return for cash to sustain or grow the business. Companies can also buy back stock, which often lets investors recoup the initial investment plus capital gains from subsequent rises in stock price. Stock options issued by many companies as part of employee compensation do not represent ownership, but represent the right to buy ownership at a future time at a specified price. This would represent a windfall to the employees if the option is exercised when the market price is higher than the promised price, since if they immediately sold the stock they would keep the difference (minus taxes).\n\nStock bought and sold in private markets fall within the private equity realm of finance.\n\nShares\nA person who owns a percentage of the stock has the ownership of the corporation proportional to their share. The shares form a stock. The stock of a corporation is partitioned into shares, the total of which are stated at the time of business formation. Additional shares may subsequently be authorized by the existing shareholders and issued by the company. In some jurisdictions, each share of stock has a certain declared par value, which is a nominal accounting value used to represent the equity on the balance sheet of the corporation. In other jurisdictions, however, shares of stock may be issued without associated par value.\n\nShares represent a fraction of ownership in a business. A business may declare different types (or classes) of shares, each having distinctive ownership rules, privileges, or share values. Ownership of shares may be documented by issuance of a stock certificate. A stock certificate is a legal document that specifies the number of shares owned by the shareholder, and other specifics of the shares, such as the par value, if any, or the class of the shares.\n\nIn the United Kingdom, Republic of Ireland, South Africa, and Australia, stock can also refer, less commonly, to all kinds of marketable securities.[4]', 'post-bg.jpg', '2024-01-19 06:47:20'),
(2, 'Artificial intelligence', 'Artificial intelligence (AI) is the intelligence of machines or software', 'artificial-intelligence', 'Artificial intelligence (AI) is the intelligence of machines or software, as opposed to the intelligence of humans or other animals. It is a field of study in computer science that develops and studies intelligent machines. Such machines may be called AIs.\r\n\r\nAI technology is widely used throughout industry, government, and science. Some high-profile applications are: advanced web search engines (e.g., Google Search), recommendation systems (used by YouTube, Amazon, and Netflix), understanding human speech (such as Google Assistant, Siri, and Alexa), self-driving cars (e.g., Waymo), generative and creative tools (ChatGPT and AI art), and superhuman play and analysis in strategy games (such as chess and Go).[1]\r\n\r\nAlan Turing was the first person to conduct substantial research in the field that he called Machine Intelligence.[2] Artificial intelligence was founded as an academic discipline in 1956.[3] The field went through multiple cycles of optimism[4][5] followed by disappointment and loss of funding.[6][7] Funding and interest vastly increased after 2012 when deep learning surpassed all previous AI techniques,[8] and after 2017 with the transformer architecture.[9] This led to the AI spring of the early 2020s, with companies, universities, and laboratories overwhelmingly based in the United States pioneering significant advances in artificial intelligence.[10]\r\n\r\nThe various sub-fields of AI research are centered around particular goals and the use of particular tools. The traditional goals of AI research include reasoning, knowledge representation, planning, learning, natural language processing, perception, and support for robotics.[a] General intelligence (the ability to complete any task performable by a human) is among the field\'s long-term goals.[11]\r\n\r\nTo solve these problems, AI researchers have adapted and integrated a wide range of problem-solving techniques, including search and mathematical optimization, formal logic, artificial neural networks, and methods based on statistics, operations research, and economics.[b] AI also draws upon psychology, linguistics, philosophy, neuroscience and other fields.[12]', 'ArtificialIntelligence.jpg', '2024-01-19 19:55:05'),
(3, 'Data science', 'Data science is an interdisciplinary academic field', 'data-science', 'Data science is an interdisciplinary academic field[1] that uses statistics, scientific computing, scientific methods, processes, algorithms and systems to extract or extrapolate knowledge and insights from potentially noisy, structured, or unstructured data.[2]\r\n\r\nData science also integrates domain knowledge from the underlying application domain (e.g., natural sciences, information technology, and medicine).[3] Data science is multifaceted and can be described as a science, a research paradigm, a research method, a discipline, a workflow, and a profession.[4]\r\n\r\nData science is a \"concept to unify statistics, data analysis, informatics, and their related methods\" to \"understand and analyze actual phenomena\" with data.[5] It uses techniques and theories drawn from many fields within the context of mathematics, statistics, computer science, information science, and domain knowledge.[6] However, data science is different from computer science and information science. Turing Award winner Jim Gray imagined data science as a \"fourth paradigm\" of science (empirical, theoretical, computational, and now data-driven) and asserted that \"everything about science is changing because of the impact of information technology\" and the data deluge.[7][8]\r\n\r\nA data scientist is a professional who creates programming code and combines it with statistical knowledge to create insights from data.[9]', 'DataScience.jpg', '2024-01-20 07:07:52'),
(4, 'Data structure', 'Data structures serve as the basis for abstract data types (ADT)', 'data-structure', 'In computer science, a data structure is a data organization, management, and storage format that is usually chosen for efficient access to data.[1][2][3] More precisely, a data structure is a collection of data values, the relationships among them, and the functions or operations that can be applied to the data,[4] i.e., it is an algebraic structure about data.\r\n\r\nUsage\r\nData structures serve as the basis for abstract data types (ADT). The ADT defines the logical form of the data type. The data structure implements the physical form of the data type.[5]\r\n\r\nDifferent types of data structures are suited to different kinds of applications, and some are highly specialized to specific tasks. For example, relational databases commonly use B-tree indexes for data retrieval,[6] while compiler implementations usually use hash tables to look up identifiers.[7]\r\n\r\nData structures provide a means to manage large amounts of data efficiently for uses such as large databases and internet indexing services. Usually, efficient data structures are key to designing efficient algorithms. Some formal design methods and programming languages emphasize data structures, rather than algorithms, as the key organizing factor in software design. Data structures can be used to organize the storage and retrieval of information stored in both main memory and secondary memory.[8]', 'DataStructure.jpg', '2024-01-20 07:07:19'),
(5, 'Algorithm', 'An algorithm is a finite sequence of rigorous instructions', 'algorithm', 'In mathematics and computer science, an algorithm (/ˈælɡərɪðəm/ ⓘ) is a finite sequence of rigorous instructions, typically used to solve a class of specific problems or to perform a computation.[1] Algorithms are used as specifications for performing calculations and data processing. More advanced algorithms can use conditionals to divert the code execution through various routes (referred to as automated decision-making) and deduce valid inferences (referred to as automated reasoning), achieving automation eventually. Using human characteristics as descriptors of machines in metaphorical ways was already practiced by Alan Turing with terms such as \"memory\", \"search\" and \"stimulus\".[2]\r\n\r\nIn contrast, a heuristic is an approach to problem solving that may not be fully specified or may not guarantee correct or optimal results, especially in problem domains where there is no well-defined correct or optimal result.[3] For example, social media recommender systems rely on heuristics in such a way that, although widely characterized as \"algorithms\" in 21st century popular media, cannot deliver correct results due to the nature of the problem.\r\n\r\nAs an effective method, an algorithm can be expressed within a finite amount of space and time[4] and in a well-defined formal language[5] for calculating a function.[6] Starting from an initial state and initial input (perhaps empty),[7] the instructions describe a computation that, when executed, proceeds through a finite[8] number of well-defined successive states, eventually producing \"output\"[9] and terminating at a final ending state. The transition from one state to the next is not necessarily deterministic; some algorithms, known as randomized algorithms, incorporate random input.[10]', 'Algorithm.jpg', '2024-01-19 19:53:28'),
(6, 'Computer Network', 'A computer network is a set of computers sharing resources located on or provided by network nodes.', 'computer-network', 'A computer network is a set of computers sharing resources located on or provided by network nodes. Computers use common communication protocols over digital interconnections to communicate with each other. These interconnections are made up of telecommunication network technologies based on physically wired, optical, and wireless radio-frequency methods that may be arranged in a variety of network topologies.\r\n\r\nThe nodes of a computer network can include personal computers, servers, networking hardware, or other specialized or general-purpose hosts. They are identified by network addresses and may have hostnames. Hostnames serve as memorable labels for the nodes and are rarely changed after initial assignment. Network addresses serve for locating and identifying the nodes by communication protocols such as the Internet Protocol.\r\n\r\nComputer networks may be classified by many criteria, including the transmission medium used to carry signals, bandwidth, communications protocols to organize network traffic, the network size, the topology, traffic control mechanisms, and organizational intent.[citation needed]\r\n\r\nComputer networks support many applications and services, such as access to the World Wide Web, digital video and audio, shared use of application and storage servers, printers and fax machines, and use of email and instant messaging applications.', 'ComputerNetwork.jpg', '2024-01-20 07:08:25'),
(7, 'Web Development', 'Web development is the work involved in developing a website for the Internet or an intranet.', 'web-development', 'Web development is the work involved in developing a website for the Internet (World Wide Web) or an intranet (a private network).[1] Web development can range from developing a simple single static page of plain text to complex web applications, electronic businesses, and social network services. A more comprehensive list of tasks to which Web development commonly refers, may include Web engineering, Web design, Web content development, client liaison, client-side/server-side scripting, Web server and network security configuration, and e-commerce development.\r\n\r\nAmong Web professionals, \"Web development\" usually refers to the main non-design aspects of building Web sites: writing markup and coding.[2] Web development may use content management systems (CMS) to make content changes easier and available with basic technical skills.\r\n\r\nFor larger organizations and businesses, Web development teams can consist of hundreds of people (Web developers) and follow standard methods like Agile methodologies while developing Web sites.[1] Smaller organizations may only require a single permanent or contracting developer, or secondary assignment to related job positions such as a graphic designer or information systems technician. Web development may be a collaborative effort between departments rather than the domain of a designated department. There are three kinds of Web developer specialization: front-end developer, back-end developer, and full-stack developer.[3] Front-end developers are responsible for behavior and visuals that run in the user browser, while back-end developers deal with the servers.[4] Since the commercialization of the Web, the industry has boomed and has become one of the most used technologies ever.', 'WebDevelopment.jpg', '2024-01-20 07:08:59'),
(8, 'Heuristic', 'Heuristics are the strategies derived from previous experiences with similar problems.', 'Heuristic', 'A heuristic (/hjʊˈrɪstɪk/; from Ancient Greek εὑρίσκω (heurískō) \'to find, discover\'), or heuristic technique, is any approach to problem solving or self-discovery that employs a practical method that is not guaranteed to be optimal, perfect, or rational, but is nevertheless sufficient for reaching an immediate, short-term goal or approximation. Where finding an optimal solution is impossible or impractical, heuristic methods can be used to speed up the process of finding a satisfactory solution. Heuristics can be mental shortcuts that ease the cognitive load of making a decision.[1][2]\r\n\r\nExamples that employ heuristics include using trial and error, a rule of thumb or an educated guess.\r\n\r\nHeuristics are the strategies derived from previous experiences with similar problems. These strategies depend on using readily accessible, though loosely applicable, information to control problem solving in human beings, machines and abstract issues.[3][4] When an individual applies a heuristic in practice, it generally performs as expected. However it can alternatively create systematic errors.[5]\r\n\r\nThe most fundamental heuristic is trial and error, which can be used in everything from matching nuts and bolts to finding the values of variables in algebra problems. In mathematics, some common heuristics involve the use of visual representations, additional assumptions, forward/backward reasoning and simplification. Here are a few commonly used heuristics from George Pólya\'s 1945 book, How to Solve It:[6]\r\nIf you are having difficulty understanding a problem, try drawing a picture.\r\nIf you can\'t find a solution, try assuming that you have a solution and seeing what you can derive from that (\"working backward\").\r\nIf the problem is abstract, try examining a concrete example.\r\nTry solving a more general problem first (the \"inventor\'s paradox\": the more ambitious plan may have more chances of success).\r\nIn psychology, heuristics are simple, efficient rules, either learned or inculcated by evolutionary processes. These psychological heuristics have been proposed to explain how people make decisions, come to judgements, and solve problems. These rules typically come into play when people face complex problems or incomplete information. Researchers employ various methods to test whether people use these rules. The rules have been shown to work well under most circumstances, but in certain cases can lead to systematic errors or cognitive biases.[7]', 'Heuristic.jpg', '2024-01-20 07:09:10'),
(12, 'Jmna ', 'jman he divana', 'jmana', 'anujain jmana he divan to\r\ntu nach mari rani', 'jmana.jpg', '2024-01-25 13:59:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
