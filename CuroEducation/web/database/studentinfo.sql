-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2015 at 08:00 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `studentinfo`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE IF NOT EXISTS `administrator` (
  `adminid` bigint(4) NOT NULL AUTO_INCREMENT,
  `password` varchar(50) NOT NULL,
  `adminname` varchar(80) NOT NULL,
  `address` text NOT NULL,
  `contactno` varchar(25) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=124 ;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`adminid`, `password`, `adminname`, `address`, `contactno`) VALUES
(123, '83ec45960b80c035a0068df1d9df5aa8', 'ADMIN', '123 password technology', '9876543210');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `attID` varchar(13) NOT NULL,
  `studid` varchar(20) NOT NULL,
  `totalclasses` int(2) NOT NULL,
  `attendedclasses` int(2) NOT NULL,
  `percentage` double(4,2) NOT NULL,
  `comment` text NOT NULL,
  `Month` varchar(30) NOT NULL,
  `BatchID` varchar(13) NOT NULL,
  PRIMARY KEY (`attID`),
  KEY `studid` (`studid`),
  KEY `BatchID` (`BatchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `BatchID` varchar(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `ClassDate` varchar(30) NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `CourseID` varchar(13) NOT NULL,
  PRIMARY KEY (`BatchID`),
  KEY `CourseID` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`BatchID`, `Name`, `ClassDate`, `StartTime`, `EndTime`, `CourseID`) VALUES
('BT100001', 'JAVA2', 'Monday', '00:00:11', '00:00:14', 'CS10001'),
('BT100003', 'Python', 'Friday', '00:00:03', '00:00:14', 'CS10002'),
('BT10002', 'JAVA1', 'Saturday', '00:00:08', '00:00:14', 'CS10002');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `contactid` bigint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `emailid` varchar(30) NOT NULL,
  `contactno` varchar(20) NOT NULL,
  `subject` varchar(20) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `CourseID` varchar(13) NOT NULL,
  `coursename` varchar(40) NOT NULL,
  `comment` text NOT NULL,
  `coursekey` varchar(15) NOT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `coursename`, `comment`, `coursekey`) VALUES
('CS10001', 'Bachelor of Arts', 'This Course is related to Arts field.', 'BA'),
('CS10002', 'Bachelor of Commerce', 'This course is related to commerce field.', 'BCom'),
('CS10003', 'Bachelor of Bussiness Management', 'This course is related to Bussiness field.', 'BBM'),
('CS10004', 'Bachelor of Science', 'This field is related to science field.', 'BSc'),
('CS10005', 'Bachelor of Computer Application', 'This field is related to computer field.', 'BCA'),
('CS10006', 'Bachelor of Social Work', 'This field is related to social welfare field.', 'BSW');

-- --------------------------------------------------------

--
-- Table structure for table `examination`
--

CREATE TABLE IF NOT EXISTS `examination` (
  `examid` varchar(13) NOT NULL,
  `subid` varchar(13) NOT NULL,
  `PassRate` float NOT NULL,
  `MaxMark` float NOT NULL,
  PRIMARY KEY (`examid`),
  KEY `subid` (`subid`),
  KEY `examid` (`examid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE IF NOT EXISTS `lectures` (
  `lecid` varchar(13) NOT NULL,
  `password` varchar(50) NOT NULL,
  `CourseID` varchar(13) NOT NULL,
  `lecname` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contactno` varchar(15) NOT NULL,
  PRIMARY KEY (`lecid`),
  KEY `courseid` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lectures`
--

INSERT INTO `lectures` (`lecid`, `password`, `CourseID`, `lecname`, `gender`, `address`, `contactno`) VALUES
('1', '0cc175b9c0f1b6a831c399e269772661', '5', 'geetha', 'Female', 'fgv', '9876543211');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE IF NOT EXISTS `semester` (
  `semid` bigint(4) NOT NULL AUTO_INCREMENT,
  `semester` varchar(25) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`semid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `studentdetails`
--

CREATE TABLE IF NOT EXISTS `studentdetails` (
  `studid` varchar(25) NOT NULL,
  `FullName` varchar(20) NOT NULL,
  `NameWithIn` varchar(20) NOT NULL,
  `Gender` varchar(25) NOT NULL,
  `DoB` date NOT NULL,
  `NIC` varchar(100) NOT NULL,
  `School` varchar(20) NOT NULL,
  `Stream` varchar(20) NOT NULL,
  `rAddress` varchar(200) NOT NULL,
  `ConNo` int(11) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `GName` varchar(40) NOT NULL,
  `GcNo` int(11) NOT NULL,
  `BatchID` varchar(12) NOT NULL,
  PRIMARY KEY (`studid`),
  KEY `BatchID` (`BatchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stuexam`
--

CREATE TABLE IF NOT EXISTS `stuexam` (
  `examID` varchar(13) NOT NULL,
  `studID` varchar(20) NOT NULL,
  `marks` double NOT NULL,
  `result` varchar(20) NOT NULL,
  PRIMARY KEY (`examID`,`studID`),
  KEY `studID` (`studID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `subid` varchar(13) NOT NULL,
  `subname` varchar(20) NOT NULL,
  `CourseID` varchar(13) NOT NULL,
  `lecid` bigint(4) NOT NULL,
  `subtype` varchar(25) NOT NULL,
  `semester` varchar(25) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`subid`),
  KEY `courseid` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subid`, `subname`, `CourseID`, `lecid`, `subtype`, `semester`, `comment`) VALUES
('1', 'English', 'CS10001', 0, 'Language', '1', 'fhjfbg'),
('3', 'Accounting', 'CS10003', 0, 'Theory', '1', 'jsjk');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`studid`) REFERENCES `studentdetails` (`studid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`BatchID`) REFERENCES `batch` (`BatchID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `batch`
--
ALTER TABLE `batch`
  ADD CONSTRAINT `batch_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentdetails`
--
ALTER TABLE `studentdetails`
  ADD CONSTRAINT `studentdetails_ibfk_1` FOREIGN KEY (`BatchID`) REFERENCES `batch` (`BatchID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stuexam`
--
ALTER TABLE `stuexam`
  ADD CONSTRAINT `stuexam_ibfk_1` FOREIGN KEY (`examID`) REFERENCES `examination` (`examid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stuexam_ibfk_2` FOREIGN KEY (`studID`) REFERENCES `studentdetails` (`studid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
