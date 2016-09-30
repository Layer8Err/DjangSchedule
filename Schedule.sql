
CREATE TABLE class
(
	CourseNo		CHAR(10) NOT NULL PRIMARY KEY,
	PreRequisiteCourseNo	CHAR(10) NULL,
	CourseName		VARCHAR(50) NULL,
	ElectiveFlag		CHAR(1) NOT NULL,
	SessionDurationMinutes	SMALLINT NULL,
	MaxClassSize		SMALLINT NOT NULL,
	FOREIGN KEY (PreRequisiteCourseNo) REFERENCES Class (CourseNo)
);

CREATE TABLE Period
(
	PeriodNo             SMALLINT NOT NULL PRIMARY KEY
);

CREATE TABLE educationaltrack
(
	TrackName            VARCHAR(50) NOT NULL PRIMARY KEY
);

CREATE TABLE room
(
	RoomNo               CHAR(10) NOT NULL PRIMARY KEY,
	BuildingNo           CHAR(10) NOT NULL,
	MaxClassSize         SMALLINT NOT NULL,
	UNIQUE (RoomNo, BuildingNo)
);

CREATE TABLE student
(
	StudentID            VARCHAR(20) NOT NULL PRIMARY KEY,
	GenderCd             CHAR(1) NULL
);

CREATE TABLE teacher
(
	TeacherID            VARCHAR(20) NOT NULL PRIMARY KEY,
	GenderCd             CHAR(1) NULL
);

CREATE TABLE classoffering
(
	CourseNo             CHAR(10) NOT NULL PRIMARY KEY REFERENCES Class (CourseNo),
	PeriodNo             SMALLINT NOT NULL,
	GenderSegregatedFlag CHAR(1) NULL,
	FOREIGN KEY (PeriodNo) REFERENCES Period (PeriodNo)
);

CREATE TABLE studentclassrequest
(
	StudentID            VARCHAR(20) NOT NULL PRIMARY KEY,
	CourseNo             CHAR(10) NOT NULL,
	RequestPriority      SMALLINT NOT NULL,
	FOREIGN KEY (CourseNo) REFERENCES Class (CourseNo),
	FOREIGN KEY (StudentID) REFERENCES Student (StudentID)
);

CREATE TABLE studentschedule
(
	StudentID            VARCHAR(20) NOT NULL PRIMARY KEY REFERENCES Student (StudentID),
	CourseNo             CHAR(10) NOT NULL,
	PeriodNo             SMALLINT NOT NULL,
	BuildingNo           CHAR(10) NOT NULL,
	RoomNo               CHAR(10) NOT NULL,
	FOREIGN KEY (CourseNo) REFERENCES Class (CourseNo),
	FOREIGN KEY (PeriodNo) REFERENCES Period (PeriodNo),
	FOREIGN KEY (BuildingNo, RoomNo) REFERENCES Room (BuildingNo, RoomNo)
);

CREATE TABLE teacherqualification
(
	CourseNo             CHAR(10) NOT NULL PRIMARY KEY REFERENCES Class (CourseNo),
	TeacherID            VARCHAR(20) NOT NULL,
	FOREIGN KEY (TeacherID) REFERENCES Teacher (TeacherID)
);

CREATE TABLE teacherschedule
(
	TeacherID            VARCHAR(20) NOT NULL PRIMARY KEY REFERENCES Teacher (TeacherID),
	CourseNo             CHAR(10) NOT NULL,
	PeriodNo             SMALLINT NOT NULL,
	BuildingNo           CHAR(10) NOT NULL,
	RoomNo               CHAR(10) NOT NULL,
	FOREIGN KEY (CourseNo) REFERENCES Class (CourseNo),
	FOREIGN KEY (PeriodNo) REFERENCES Period (PeriodNo),
	FOREIGN KEY (BuildingNo, RoomNo) REFERENCES room (BuildingNo, RoomNo)
);

CREATE TABLE trackclass
(
	TrackName            VARCHAR(50) NOT NULL PRIMARY KEY REFERENCES EducationalTrack (TrackName),
	CourseNo             CHAR(10) NOT NULL,
	RecommendedFlag      CHAR(1) NULL,
	RequiredFlag         CHAR(1) NULL,
	FOREIGN KEY (CourseNo) REFERENCES Class (CourseNo)
);
