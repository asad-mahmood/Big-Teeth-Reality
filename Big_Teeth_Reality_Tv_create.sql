CREATE TABLE Actions (
    ActionID integer NOT NULL CONSTRAINT Actions_pk PRIMARY KEY,
    EventID integer NOT NULL,
    Sequence integer NOT NULL,
    Description text NOT NULL,
    EstimatedTime numeric NOT NULL,
    CONSTRAINT Actions_Event FOREIGN KEY (EventID)
    REFERENCES Event (EventID)
);

-- Table: Contact
CREATE TABLE Contact (
    ContestantID integer NOT NULL,
    PhoneType text NOT NULL,
    PnoneNo integer NOT NULL,
    CONSTRAINT Contact_Contestant FOREIGN KEY (ContestantID)
    REFERENCES Contestant (ContestantID)
);

-- Table: Contestant
CREATE TABLE Contestant (
    ContestantID integer NOT NULL CONSTRAINT ContestantID PRIMARY KEY,
    NationalID text NOT NULL,
    Name varchar(255) NOT NULL,
    Address varchar(255) NOT NULL,
    City varchar(255) NOT NULL,
    State varchar(255) NOT NULL,
    PostalCode varchar(255) NOT NULL,
    DOB date NOT NULL,
    ProducerRating integer NOT NULL,
    DirectorRating integer NOT NULL,
    Finalist boolean NOT NULL,
    AppearanceRating integer NOT NULL,
    StrengthRating integer NOT NULL,
    Photo blob NOT NULL,
    VideoID text NOT NULL,
    CandidateEssay text NOT NULL,
    CONSTRAINT NationalID UNIQUE (NationalID)
);

-- Table: Crew
CREATE TABLE Crew (
    CrewID integer NOT NULL CONSTRAINT Crew_pk PRIMARY KEY,
    EventID integer NOT NULL,
    ProducerID integer NOT NULL,
    DirectorID integer NOT NULL,
    CONSTRAINT Crew_Event FOREIGN KEY (EventID)
    REFERENCES Event (EventID),
    CONSTRAINT Producer_Crew FOREIGN KEY (ProducerID)
    REFERENCES Producer (ProducerID),
    CONSTRAINT Director_Crew FOREIGN KEY (DirectorID)
    REFERENCES Director (DirectorID)
);

-- Table: CrimeRecord
CREATE TABLE CrimeRecord (
    ContestantID integer NOT NULL,
    Date date NOT NULL,
    Category text NOT NULL,
    Description text NOT NULL,
    Outcome text NOT NULL,
    CONSTRAINT Contestant_CrimeRecord FOREIGN KEY (ContestantID)
    REFERENCES Contestant (ContestantID)
);

-- Table: Degree
CREATE TABLE Degree (
    DegreeID integer NOT NULL CONSTRAINT Degree_pk PRIMARY KEY,
    Name varchar(255) NOT NULL,
    Level integer NOT NULL
);

-- Table: Director
CREATE TABLE Director (
    DirectorID integer NOT NULL CONSTRAINT Director_pk PRIMARY KEY,
    Director varchar(255) NOT NULL
);

-- Table: Education
CREATE TABLE Education (
    ContestantID integer NOT NULL,
    DegreeID integer NOT NULL,
    Comment text NOT NULL,
    Contact integer NOT NULL,
    CONSTRAINT Education_Contestant FOREIGN KEY (ContestantID)
    REFERENCES Contestant (ContestantID),
    CONSTRAINT Degree_Education FOREIGN KEY (DegreeID)
    REFERENCES Degree (DegreeID)
);

-- Table: Employer
CREATE TABLE Employer (
    ContestantID integer NOT NULL,
    Contact integer NOT NULL,
    Comments text NOT NULL,
    CONSTRAINT Employer_Contestant FOREIGN KEY (ContestantID)
    REFERENCES Contestant (ContestantID)
);

-- Table: Episode
CREATE TABLE Episode (
    EpisodeID integer NOT NULL CONSTRAINT Episode_pk PRIMARY KEY,
    Title varchar(255) NOT NULL,
    AirDate date NOT NULL
);

-- Table: Equipment
CREATE TABLE Equipment (
    EquipmentID integer NOT NULL CONSTRAINT Equipment_pk PRIMARY KEY,
    ActionID integer NOT NULL,
    EquipmentName text NOT NULL,
    Position varchar(255) NOT NULL,
    CONSTRAINT Equipment_Actions FOREIGN KEY (ActionID)
    REFERENCES Actions (ActionID)
);

-- Table: Event
CREATE TABLE Event (
    EventID integer NOT NULL CONSTRAINT Event_pk PRIMARY KEY,
    EpisodeID integer NOT NULL,
    Title varchar(255) NOT NULL,
    Description text NOT NULL,
    EstimatedTime numeric NOT NULL,
    EstimatedDanger integer NOT NULL,
    CONSTRAINT Event_Episode FOREIGN KEY (EpisodeID)
    REFERENCES Episode (EpisodeID)
);

-- Table: EventContestant
CREATE TABLE EventContestant (
    ContestantID integer NOT NULL CONSTRAINT EventContestant_pk PRIMARY KEY,
    EventID integer NOT NULL,
    Task varchar(255) NOT NULL,
    Result text NOT NULL,
    Points integer NOT NULL,
    Prize text NOT NULL,
    CONSTRAINT EventContestant_Event FOREIGN KEY (EventID)
    REFERENCES Event (EventID),
    CONSTRAINT Contestant_EventContestant FOREIGN KEY (ContestantID)
    REFERENCES Contestant (ContestantID)
);

-- Table: Job
CREATE TABLE Job (
    ContestantID integer NOT NULL,
    Job varchar(255) NOT NULL,
    Start date NOT NULL,
    "End" date NOT NULL,
    CONSTRAINT Job_Contestant FOREIGN KEY (ContestantID)
    REFERENCES Contestant (ContestantID)
);

-- Table: MedicalRecord
CREATE TABLE MedicalRecord (
    ContestantID integer NOT NULL,
    Medications text NOT NULL,
    Reason text NOT NULL,
    CONSTRAINT MedicalRecord_Contestant FOREIGN KEY (ContestantID)
    REFERENCES Contestant (ContestantID)
);

-- Table: Producer
CREATE TABLE Producer (
    ProducerID integer NOT NULL CONSTRAINT Producer_pk PRIMARY KEY,
    Producer varchar(255) NOT NULL
);

-- Table: Voting
CREATE TABLE Voting (
    VoteID integer NOT NULL CONSTRAINT Voting_pk PRIMARY KEY,
    EpisodeID integer NOT NULL,
    ContestantID integer NOT NULL,
    Region varchar(255) NOT NULL,
    Method varchar(255) NOT NULL,
	Votes  integer NOT NULL,
    CONSTRAINT Voting_Episode FOREIGN KEY (EpisodeID)
    REFERENCES Episode (EpisodeID),
    CONSTRAINT Contestant_Voting FOREIGN KEY (ContestantID)
    REFERENCES Contestant (ContestantID)
);

-- End of file.

