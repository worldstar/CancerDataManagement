CREATE TABLE `CancerGroup` (
  `CancerGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `CancerGroupName` varchar(20) NOT NULL,
  `createdDate` binary(8) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`CancerGroupID`),
  KEY `cancergroup_ibfk_1` (`UserID`),
  CONSTRAINT `cancergroup_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CancerPart` (
  `CancerPartID` int(11) NOT NULL AUTO_INCREMENT,
  `CancerPartName` varchar(20) NOT NULL,
  `createdDate` binary(8) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`CancerPartID`),
  KEY `CancerPart_ibfk_1` (`UserID`),
  CONSTRAINT `CancerPart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Country` (
  `CountryID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(20) NOT NULL,
  `createdDate` binary(8) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`CountryID`),
  KEY `Country_ibfk_1` (`UserID`),
  CONSTRAINT `Country_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `DataType` (
  `DataTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `DataTypeName` varchar(20) NOT NULL,
  `createdDate` binary(8) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`DataTypeID`),
  KEY `DataType_ibfk_1` (`UserID`),
  CONSTRAINT `DataType_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Diagnosis` (
  `DiagnosisID` int(11) NOT NULL AUTO_INCREMENT,
  `DiagnosisName` varchar(20) NOT NULL,
  `CancerPartID` int(11) NOT NULL,
  `StatisticID` int(11) NOT NULL,
  `DataTypeID` int(11) NOT NULL,
  `SequenceNumber` varchar(5) NOT NULL,
  `Histology` varchar(8) NOT NULL,
  `BehaviorCode` varchar(10) NOT NULL,
  `Differentiation` varchar(10) NOT NULL,
  `TumorSize` varchar(6) NOT NULL,
  `cT` varchar(50) NOT NULL,
  `cN` varchar(5) NOT NULL,
  `cM` varchar(5) NOT NULL,
  `cStage` varchar(5) NOT NULL,
  `Recurrence` tinyint(3) unsigned NOT NULL,
  `VitalStatus` tinyint(3) unsigned NOT NULL,
  `createdDate` binary(8) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`DiagnosisID`),
  KEY `Diagnosis_ibfk_1` (`CancerPartID`),
  KEY `Diagnosis_ibfk_2` (`StatisticID`),
  KEY `Diagnosis_ibfk_3` (`DataTypeID`),
  KEY `Diagnosis_ibfk_4` (`UserID`),
  CONSTRAINT `Diagnosis_ibfk_4` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Diagnosis_ibfk_1` FOREIGN KEY (`CancerPartID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Diagnosis_ibfk_2` FOREIGN KEY (`StatisticID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Diagnosis_ibfk_3` FOREIGN KEY (`DataTypeID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Patients` (
  `PatientsID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientsName` varchar(50) NOT NULL,
  `SexTypeID` int(11) NOT NULL,
  `DateOfBirth` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `RegionID` int(11) NOT NULL,
  `CountryID` int(11) NOT NULL,
  `createdDate` binary(8) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`PatientsID`),
  KEY `Patients_ibfk_1` (`SexTypeID`),
  KEY `Patients_ibfk_2` (`RegionID`),
  KEY `Patients_ibfk_3` (`CountryID`),
  KEY `Patients_ibfk_4` (`UserID`),
  CONSTRAINT `Patients_ibfk_4` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Patients_ibfk_1` FOREIGN KEY (`SexTypeID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Patients_ibfk_2` FOREIGN KEY (`RegionID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Patients_ibfk_3` FOREIGN KEY (`CountryID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Region` (
  `SexTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `SexTypeName` varchar(10) NOT NULL,
  `createdDate` binary(8) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`SexTypeID`),
  KEY `Region_ibfk_1` (`UserID`),
  CONSTRAINT `Region_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `SexType` (
  `SexTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `SexTypeName` varchar(10) NOT NULL,
  `createdDate` binary(8) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`SexTypeID`),
  KEY `SexType_ibfk_1` (`UserID`),
  CONSTRAINT `SexType_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Statistic` (
  `StatisticID` int(11) NOT NULL AUTO_INCREMENT,
  `StatisticName` varchar(50) NOT NULL,
  `createdDate` binary(8) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`StatisticID`),
  KEY `Statistic_ibfk_1` (`UserID`),
  CONSTRAINT `Statistic_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sysdiagrams` (
  `name` varchar(160) NOT NULL,
  `principal_id` int(11) NOT NULL,
  `diagram_id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `UK_principal_name` (`principal_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `UserAccount` varchar(50) NOT NULL,
  `Userpassword` varchar(50) NOT NULL,
  `createdDate` binary(8) NOT NULL,
  `CreatedUserID` int(11) NOT NULL,
  `isValidated` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `Users_ibfk_1` (`CreatedUserID`),
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`CreatedUserID`) REFERENCES `Users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

