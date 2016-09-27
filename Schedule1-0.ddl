
CREATE TABLE Class
(
	CourseNo             CHAR(10) NOT NULL,
	PreRequisiteCourseNo CHAR(10) NULL,
	CourseName           VARCHAR(50) NULL,
	ElectiveFlag         CHAR(1) NOT NULL,
	SessionDurationMinutes SMALLINT NULL,
	MaxClassSize         SMALLINT NOT NULL
);

ALTER TABLE Class
ADD PRIMARY KEY (CourseNo);

CREATE TABLE ClassOffering
(
	CourseNo             CHAR(10) NOT NULL,
	PeriodNo             SMALLINT NOT NULL,
	GenderSegregatedFlag CHAR(1) NULL
);

ALTER TABLE ClassOffering
ADD PRIMARY KEY (CourseNo,PeriodNo);

CREATE TABLE EducationalTrack
(
	TrackName            VARCHAR(50) NOT NULL
);

ALTER TABLE EducationalTrack
ADD PRIMARY KEY (TrackName);

CREATE TABLE Period
(
	PeriodNo             SMALLINT NOT NULL
);

ALTER TABLE Period
ADD PRIMARY KEY (PeriodNo);

CREATE TABLE Room
(
	BuildingNo           CHAR(10) NOT NULL,
	RoomNo               CHAR(10) NOT NULL,
	MaxClassSize         SMALLINT NOT NULL
);

ALTER TABLE Room
ADD PRIMARY KEY (BuildingNo,RoomNo);

CREATE TABLE Student
(
	StudentID            VARCHAR(20) NOT NULL,
	GenderCd             CHAR(1) NULL
);

ALTER TABLE Student
ADD PRIMARY KEY (StudentID);

CREATE TABLE StudentClassRequest
(
	StudentID            VARCHAR(20) NOT NULL,
	CourseNo             CHAR(10) NOT NULL,
	RequestPriority      SMALLINT NOT NULL
);

ALTER TABLE StudentClassRequest
ADD PRIMARY KEY (StudentID,CourseNo);

CREATE TABLE StudentSchedule
(
	StudentID            VARCHAR(20) NOT NULL,
	CourseNo             CHAR(10) NOT NULL,
	PeriodNo             SMALLINT NOT NULL,
	BuildingNo           CHAR(10) NOT NULL,
	RoomNo               CHAR(10) NOT NULL
);

ALTER TABLE StudentSchedule
ADD PRIMARY KEY (StudentID,CourseNo,PeriodNo);

CREATE TABLE Teacher
(
	TeacherID            VARCHAR(20) NOT NULL,
	GenderCd             CHAR(1) NULL
);

ALTER TABLE Teacher
ADD PRIMARY KEY (TeacherID);

CREATE TABLE TeacherQualification
(
	CourseNo             CHAR(10) NOT NULL,
	TeacherID            VARCHAR(20) NOT NULL
);

ALTER TABLE TeacherQualification
ADD PRIMARY KEY (CourseNo,TeacherID);

CREATE TABLE TeacherSchedule
(
	TeacherID            VARCHAR(20) NOT NULL,
	CourseNo             CHAR(10) NOT NULL,
	PeriodNo             SMALLINT NOT NULL,
	BuildingNo           CHAR(10) NOT NULL,
	RoomNo               CHAR(10) NOT NULL
);

ALTER TABLE TeacherSchedule
ADD PRIMARY KEY (TeacherID,CourseNo,PeriodNo);

CREATE TABLE TrackClass
(
	TrackName            VARCHAR(50) NOT NULL,
	CourseNo             CHAR(10) NOT NULL,
	RecommendedFlag      CHAR(1) NULL,
	RequiredFlag         CHAR(1) NULL
);

ALTER TABLE TrackClass
ADD PRIMARY KEY (TrackName,CourseNo);

ALTER TABLE Class
ADD (PreRequisiteCourseNo) REFERENCES Class (CourseNo);

ALTER TABLE ClassOffering
ADD (CourseNo) REFERENCES Class (CourseNo);

ALTER TABLE ClassOffering
ADD (PeriodNo) REFERENCES Period (PeriodNo);

ALTER TABLE StudentClassRequest
ADD (CourseNo) REFERENCES Class (CourseNo);

ALTER TABLE StudentClassRequest
ADD (StudentID) REFERENCES Student (StudentID);

ALTER TABLE StudentSchedule
ADD (CourseNo) REFERENCES Class (CourseNo);

ALTER TABLE StudentSchedule
ADD (PeriodNo) REFERENCES Period (PeriodNo);

ALTER TABLE StudentSchedule
ADD (BuildingNo, RoomNo) REFERENCES Room (BuildingNo, RoomNo);

ALTER TABLE StudentSchedule
ADD (StudentID) REFERENCES Student (StudentID);

ALTER TABLE TeacherQualification
ADD (CourseNo) REFERENCES Class (CourseNo);

ALTER TABLE TeacherQualification
ADD (TeacherID) REFERENCES Teacher (TeacherID);

ALTER TABLE TeacherSchedule
ADD (CourseNo) REFERENCES Class (CourseNo);

ALTER TABLE TeacherSchedule
ADD (PeriodNo) REFERENCES Period (PeriodNo);

ALTER TABLE TeacherSchedule
ADD (BuildingNo, RoomNo) REFERENCES Room (BuildingNo, RoomNo);

ALTER TABLE TeacherSchedule
ADD (TeacherID) REFERENCES Teacher (TeacherID);

ALTER TABLE TrackClass
ADD (CourseNo) REFERENCES Class (CourseNo);

ALTER TABLE TrackClass
ADD (TrackName) REFERENCES EducationalTrack (TrackName);
