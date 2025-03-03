USE [SE1940_StuPET]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 3/3/2025 9:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[did] [int] NOT NULL,
	[dname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/3/2025 9:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[eid] [int] NOT NULL,
	[ename] [varchar](150) NOT NULL,
	[did] [int] NOT NULL,
	[managerid] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 3/3/2025 9:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[fid] [int] NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveRequests]    Script Date: 3/3/2025 9:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveRequests](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](150) NOT NULL,
	[reason] [varchar](150) NOT NULL,
	[from] [date] NOT NULL,
	[to] [date] NOT NULL,
	[status] [tinyint] NOT NULL,
	[createdby] [varchar](150) NOT NULL,
	[owner_eid] [int] NOT NULL,
	[createddate] [datetime] NOT NULL,
 CONSTRAINT [PK_LeaveRequests] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 3/3/2025 9:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[rid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Feature] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/3/2025 9:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/3/2025 9:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [int] NOT NULL,
	[sname] [varchar](150) NOT NULL,
	[sgender] [bit] NOT NULL,
	[sdob] [date] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role]    Script Date: 3/3/2025 9:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role](
	[username] [varchar](150) NOT NULL,
	[rid] [int] NOT NULL,
 CONSTRAINT [PK_User_Role] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/3/2025 9:23:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [nvarchar](150) NOT NULL,
	[eid] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Department] ([did], [dname]) VALUES (1, N'IT')
INSERT [dbo].[Department] ([did], [dname]) VALUES (2, N'Accounting')
INSERT [dbo].[Department] ([did], [dname]) VALUES (3, N'Marketing')
GO
INSERT [dbo].[Employees] ([eid], [ename], [did], [managerid]) VALUES (1, N'Ngo Tung Son', 1, NULL)
INSERT [dbo].[Employees] ([eid], [ename], [did], [managerid]) VALUES (2, N'Mr A', 1, 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [managerid]) VALUES (3, N'Mr B', 1, 1)
INSERT [dbo].[Employees] ([eid], [ename], [did], [managerid]) VALUES (4, N'Mr C', 1, 2)
INSERT [dbo].[Employees] ([eid], [ename], [did], [managerid]) VALUES (5, N'Mr D', 1, 2)
GO
INSERT [dbo].[Features] ([fid], [url]) VALUES (1, N'/student/list')
INSERT [dbo].[Features] ([fid], [url]) VALUES (2, N'/student/create')
INSERT [dbo].[Features] ([fid], [url]) VALUES (3, N'/student/update')
INSERT [dbo].[Features] ([fid], [url]) VALUES (4, N'/student/delete')
INSERT [dbo].[Features] ([fid], [url]) VALUES (5, N'/leaverequest/create')
INSERT [dbo].[Features] ([fid], [url]) VALUES (6, N'/leaverequest/update')
GO
SET IDENTITY_INSERT [dbo].[LeaveRequests] ON 

INSERT [dbo].[LeaveRequests] ([rid], [title], [reason], [from], [to], [status], [createdby], [owner_eid], [createddate]) VALUES (1, N'111xx', N'111111xx', CAST(N'2025-03-04' AS Date), CAST(N'2025-03-06' AS Date), 0, N'mra', 1, CAST(N'2025-03-03T08:38:08.907' AS DateTime))
INSERT [dbo].[LeaveRequests] ([rid], [title], [reason], [from], [to], [status], [createdby], [owner_eid], [createddate]) VALUES (2, N'xxxxa', N'aaaaaa', CAST(N'2025-03-04' AS Date), CAST(N'2025-03-05' AS Date), 0, N'mra', 2, CAST(N'2025-03-03T08:41:29.220' AS DateTime))
SET IDENTITY_INSERT [dbo].[LeaveRequests] OFF
GO
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 1)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 2)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 3)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 4)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 5)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 6)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 1)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 2)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 3)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 5)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 6)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (3, 1)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (3, 2)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (3, 5)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (3, 6)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (4, 1)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (4, 5)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (4, 6)
GO
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (1, N'director')
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (2, N'division leader')
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (3, N'manager')
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (4, N'staff')
INSERT [dbo].[Roles] ([rid], [rname]) VALUES (5, N'stupid')
GO
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob]) VALUES (1, N'Mr A', 1, CAST(N'2004-02-05' AS Date))
INSERT [dbo].[Student] ([sid], [sname], [sgender], [sdob]) VALUES (2, N'Ms B', 0, CAST(N'2004-06-14' AS Date))
GO
INSERT [dbo].[User_Role] ([username], [rid]) VALUES (N'mra', 2)
INSERT [dbo].[User_Role] ([username], [rid]) VALUES (N'mra', 3)
INSERT [dbo].[User_Role] ([username], [rid]) VALUES (N'mrb', 3)
INSERT [dbo].[User_Role] ([username], [rid]) VALUES (N'mrd', 5)
INSERT [dbo].[User_Role] ([username], [rid]) VALUES (N'sonnt', 1)
GO
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'mra', N'123', N'Mr A', 2)
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'mrb', N'123', N'Mr B', 3)
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'mrc', N'123', N'NO Role', 4)
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'mrd', N'123', N'Has Role - No feature', 5)
INSERT [dbo].[Users] ([username], [password], [displayname], [eid]) VALUES (N'sonnt', N'123', N'Cơ bụng sáu ngấn', 1)
GO
ALTER TABLE [dbo].[LeaveRequests] ADD  CONSTRAINT [DF_LeaveRequests_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Department] FOREIGN KEY([did])
REFERENCES [dbo].[Department] ([did])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Department]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([managerid])
REFERENCES [dbo].[Employees] ([eid])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[LeaveRequests]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequests_Employees] FOREIGN KEY([owner_eid])
REFERENCES [dbo].[Employees] ([eid])
GO
ALTER TABLE [dbo].[LeaveRequests] CHECK CONSTRAINT [FK_LeaveRequests_Employees]
GO
ALTER TABLE [dbo].[LeaveRequests]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequests_Users] FOREIGN KEY([createdby])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[LeaveRequests] CHECK CONSTRAINT [FK_LeaveRequests_Users]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Features] FOREIGN KEY([fid])
REFERENCES [dbo].[Features] ([fid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Features]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Roles] FOREIGN KEY([rid])
REFERENCES [dbo].[Roles] ([rid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Roles]
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_Roles] FOREIGN KEY([rid])
REFERENCES [dbo].[Roles] ([rid])
GO
ALTER TABLE [dbo].[User_Role] CHECK CONSTRAINT [FK_User_Role_Roles]
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_Users] FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[User_Role] CHECK CONSTRAINT [FK_User_Role_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Employees] FOREIGN KEY([eid])
REFERENCES [dbo].[Employees] ([eid])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Employees]
GO
