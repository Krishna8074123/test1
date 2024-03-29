  					Ansible...
Ansible is an open source automation tool that can be used to automate the configuration and management of servers, networks and other IT infrastructure.
It is often used in conjuction with other tools such as terraform to provide a complete infrastructure as code solution.
Ansible uses a simple human readable language called 'YAML' to define automation tasks called 'Playbooks".
These playbooks are written in the form of plays, which consists of a set of tasks that are executed on one or more hosts.
Ansible uses a push based approach, where the automation tasks are executed on the target hosts directly rather than requiring an agent to be installed on these hosts.
This allows ansible to be used to automate a wide variety of system, including linux, windows and network devices.
One of the main benefits of ansible is its ease of use.
The yaml based playbooks are easy to read and understand even for non-technical users.
Ansible provides a large number of pre-built modules called "ansible modules" that can be used to automate common tasks can be used to automate common tasks such as installing softwares, managing users and configuring services.
Ansible allows for the management of multiple hosts using inventory files which contains a list of the hosts that ansible should manage.
This allows for easy management of large number of hosts and simplifies the process of scalling automation tasks.
Ansible also supports a concept called 'roles' which are collections of tasks, files and variables that can be reused across different playbooks.
This allows for better organization and simplifies the process of automation similar tasks.
Ansible can also be integrated with other tools such as continuos integration and continuos deployment (CI/CD) pipeline, to automate the process of configuring and managing infrastructure.
This allows for faster and more reliable deployments as well as easier rollbacks in case of issues.
Over all, Ansible is a powerful and flexible automation tool that can be used to automate the configuration and management of servers, networks and other IT infrastructure.
CI/CD....
Continuous Integration and Continuous Delivery are software Engineering practices that aim to reduce the time it takes to deliver changes to software applications.
CI is the process of integrating code changes from multiple developers into a single codebase and then building and testing code to ensure that is correct and stable.
This is typically done by setting up a build server[jenkins/azure devops,GitLab, Github Action etc] that monitors the code repository runs a series of tests and checks whenever new code is committed.
CD is the practice of automatically releasing code changes to production either on a scheduling or in a response to certain events.
This can involve automatically deploying code changes to test environments, staging environments or directly to production.
Together CI/CD aims to improve the speed, quality and reliable of software development by automating many of the tasks that are traditionally done manually.
By integrating and testing code changes more frequently and releasing then to production more quickly and reliable, organizations can iterate faster, respond more quickly to changing business needs and deliver a better user experience.
The build server automatically runs a series of tests and checks whenever new code is committed. These tests can include static analysis checks, unit tests, integration tests and other types of tests that are designed to ensure that the code is correct and meets the required quality standards.
If the tests pass, the build server typically package the code into a deployable form such as docker image or package files and store it in an artifactory repository.
If the tests fail, the build server will typically send an alert to the developers and stop the build process.
The goal of continuous delivery is to make it as easy and safe as possible to release code changes by automating as many of the tasks as possible.
This can include tasks such as deploying code changes to multiple environments running integration tests and rolling back changes if necessary.
Popular CI/CD Tools:
Jenkins , GitLab, Azure devops, AWS devops
Devops Pipeline...
A pipeline in devops is a set of automated process that are used to build test and deploy software.
First Stage
The first stage in a devops pipeline is the code repository, where the source code of the applications is stored and managed.
When the code is pushed to the version control system like Git. Here the versions of the code is maintained using different tags.
Second Stage
The second stage in a devops pipeline is building the application to create packages and images in case of container technology.
The package or container image will stored in any registry like jfrog, ECR, ACR, Docker hub etc.
The artifacts are maintained for versioning,
When the developers or the deployment need some older version then this artifacts can be download from remote repository.
Third Stage
The third stage in the devops pipeline is testing. In this stage there wil be multiple tests.
First Test
The first test is static code analysis called software composition analysis.
Here the code will be scanned for any bugs and the developer written tests should cover atleast 90% of the code and this may vary.
Second Test
The second test is dependency check where we will be scanning the dependencies used in the code. Generally owaspis used.
Third Test
The third test is scanning the container image scanning.
We need to scan for the vulnerabilities in the images.
We also need to test the performance tests and user acceptance test but these will be done after the deployment.
Fourth Stage
The fourth stage in the devops pipeline is continuos deployment.
The application build in the second stage is deployed to different test environment automatically.
Here different types of automated tests like selenium and some manual tests are conducted.
Common deployment tools are Jenkins, Ansible and Terraform.
Fifth Stage
The fifth stage in the devops pipeline is creating or provisioning infrastructure.
We need some cloud or on-premises infrastructure to deploy the application.
Generally terraform or ARM Templates or AWS cloud formation is used.
Here new or provisioned infrastructure is maintained as code called as 'Infrastructure as code'.
Sixth Stage
The sixth stage in the devops pipeline is deployment.
After creating infrastructure we need to deploy the new or latest version of the application.
Generally any configuration tools like Ansible, Chef, Puppet etc are used to deploy the application in the servers located anywhere. 
If the application is microservice and using orchestration like docker and kubernetes then the kubectl or any kube api server commands are used to deploy the application.
Seventh Stage
The seventh stage and the last stage in the pipeline is monitoring the application when the application is accessed by the users some logs will be generated. We can filter them and know how, where who are accessing our application.
Eight Stage
Here after there will new changes in the code or the requirement of the clients and pipeline will start from first stage

Docker...
Docker is an open source platform that enables the use of containers for packaging, shipping and running applications.
Containers are light-weight, standalone executable packages that include everything needed to run a piece of software, including the code runtime, system tools, libraries and settings.
Docker uses a containerization approach which means that it packages the application and its dependencies together in a container rather than virtualization the entire operating system.
This allows for more efficient use of resources and faster deployment times as well as better consistency between development and production environments.
Docker uses a client-server architecture where the docker daemon is responsible for managing the containers, the docker CLI is used to interact with the daemon.
The docker daemon runs on the host machine and the containers run in a shared namespace on the host.
Isolation
Containers provide isolation between the application and the host system, which means that the application runs in a self-contained environments that is separated from the host system.
Portability
containers can be easily moved between different environments such as between developing, testing, Production.
Versioning
Docker provides versioning for containers, so that different versioning of an application can be easily deployed and managed.
Image Management
Docker provides a centralized image repository called docker hub, where users can store and share container images.
Orchestration
Docker provides an orchestration tool called 'Docker Compose' which allows multiple containers to be defined and managed as a single application.
Dockerfile
Docker can be used in conjuction with other tools such as terraform and ansible to provide a complete infrastructure as code solution,
It can also be integrated with CI/CD pipelines to automate the process of building, testing and deploying applications.
Docker images are created using a simple text file called 'Dockerfile'.
This file contains instructions that describes how the images should be built.
These instructions include commands such as
'FROM' which specifies the base image to use.
'RUN' which runs commands inside the container.
'COPY' which copies files from the host to the container.
'EXPOSE' which exposes ports on the container.
Once the image is built , it can be run as a container.
Docker images are built on top of each other using a layering file system.
Each instruction in the 'Dockerfile' creates a new layer in the image and each layer contains the changes made in that instruction.
This allows for efficient storage and distribution of images, as only the changes made in each layer need to be stored.

Jenkins...
Jenkins is an open-source automation server that is designed to help developers build, test, and deploy software automatically.
It is one of the most widely used CI/CD tools and is known for its flexibility, scalability and ease of use.
Key Features of Jenkins
CI: Jenkins can be configured to monitor a code repository such as git, jira for changes and automatically trigger a build, test, and deploy process when new code is committed.
This helps to catch and fix errors early in the development process and ensures that the code base is always in reliable state.
Build Automation
Jenkins can be configured to run a variety of build tools such as maven gradle etc. to compile and package code and create deployable artifacts such as jar and war files or docker images.
Jenkins also supports parallel builds execution, which allows you to run multiple builds simultaneously to speed up the process.
Test Automation
Jenkins can be configured to run a variety of tests such as unit tests, integration tests, acceptance tests to ensure that the code is correct and meets the required quality standards.
Jenkins can also be configured to generated test reports and to send alerts if fail.
Deployment Automation
Jenkins can be configured to deploy code to various environments such as test, dev, staging, or prod and to perform tasks such as rolling back changes if necessary.
Jenkins can also be configured to deploy code to cloud environments such as AWS, Azure, GCP.
Plugins
Jenkins supports a wide variety of plugins, which can be used to add additional functionality such as support for new languages, frame works or services.
There are more than 1000 plugins available and new plugins are constantly being developed.
Scalability
Jenkins can be used to manage multiple projects and build agents and can scalable to handle a large number of current builds.
Jenkins can also be integrated with kubernetes to run builds agents in a containerized environment, which makes it easier to scale up and down as needed.
One of the reasons for jenkins popularity is its flexibility, jenkins can be configured to work with a wide variety of languages, frameworks and services which makes it a good choice for many types of projects.
Jenkins is also open-source and has a large and active community of users, which makes it easy to find help and documentation when needed.
In summary jenkins is a powerful too that can automate the build, test and deployment process of software development, allowing developers to focus on writing code improving the speed , quality and reliability of software development
Configuration
Jenkins is configured through a web-based interfaced, which makes it easy to setup and manage.
You can create new jobs in jenkins to represent different projects or stages of the build-test-deploy process and then configure each job with the appropriate settings and triggers.
Security
Jenkins provides a variety of builtin security features to help you keep your build environment secure.
This includes role-based access control, which allows you to specify which users are able to perform certain actions such as creating or deleting jobs or viewing build results.
Jenkins also supports two-factor authentication, which can help protect against unauthorized access.
Monitoring
Jenkins provides a variety of reporting and monitoring features that can help you track the status of your builds and deployments.
Jenkins provides a variety of builtin reports, such as test results, build history and code coverage and it is also possible to use plugins to generate custom reports.
Jenkins also has built-in notifications that can be configured to send email or chat messages when builds fail, which can help you quickly identify and fix issues.
Jobs in jenkins
In jenkins a job is a collection of settings and triggers that define a specific stage of the build-test process.

Free Style
These are the most basic type of jobs in jenkins and are suitable for a wide variety of projects.
A free style job allows you to configure a variety of settings such as the source control repository to use, the build triggers in the build environments and the post build actions.
Pipeline Jobs
There are a more advanced type jobs in jenkins, which allows you to define the entire build test deploy process as code, using the jenkins pipeline plugin.
This type of job is more stable for complex projects with multi-stages such as code-review, testing and deployment.
Jenkins has scripted and declarative pipelines.
Multi-Configuration Jobs
These jobs are also known as matrix jobs.
These jobs allows you to run a single jenkins job multiple times with different configurations.
This is particularly useful for running tests with different configurations and environments.
Each job in jenkins can be configured to perform a specific set of tasks, such as building code, running tests or deploying code.
You can also setup build triggers to automatically run a job whenever certain event occur such as code being committed to a source control repository or a specific time of a day.
Kubernetes...
•	Kubernetes is an open-source container orchestration system that automates the management of containerized applications including scaling, self-healing and rolling updates.
•	It provides a way to deploy, scale and manage containerized applications, making it a popular choice for organizations looking to implement microservices architecture.
•	Kubernetes uses a master-slave architecture where the master node is responsible for managing the cluster and the worker nodes are responsible for running the containers.
•	The master-node provides a centralized control plane for managing the worker nodes and the worker nodes run the containers.
•	At the core of kubernetes is the concept of pod, which is the smallest and simplest unit in the kubernetes object model.

Pods
A pod represents a single instance of a running process in the cluster.
Pods can contain one or more containers and all the containers in a pod share same network, namespace meaning they can communicate with each other using localhost.
Services
A service is an abstraction that defines a logical set of pods and a policy by which to access them.
Services enabled network communication between pods and provide load balancing.
Replication Controller
A replications controller ensures that a specified number of replication of a pod are running at any given time.
If a pod crashes or deleted, the replication controller automatically starts a new replica to replace it.
Deployments
A deployment is an abstraction than provides declarative updates for pods and replication controllers.
Stateful Sets
Stateful sets provides guarantees about ordering and uniqueness of pods its used for applications that require stable network identities and persistent storage.
Secrets and Config Maps
Kubernetes provides a way to manage storage for stateful applications by saving sensitive information such as passwords tokens and other configuration data called secrets and config maps.
This allows to separate information from the application configuration and keep it secure.
Namespaces
Kubernetes provides a way to divide cluster resources among multiple teams or projects, called 'namespaces'.
It allows for the isolation of resources such as pods and services with a cluster and makes it possible to have multiple virtual cluster with in a single physical cluster.
Monitoring and Logging
Kubernetes provides a wide range of features for managing containerized applications in a cluster.
It provides builtin support for monitoring and logging which allows fot the collection of metrics and log data from pods and nodes in a cluster.
This data can be used for troubleshooting and performance analysis and can also be integrated with external monitoring and logging tools for further analysis.
Volumes
Volumes are a way to manage storage for stateful applications.
They allow data to persistent even if the pod is deleted or recreated.
Volumes are defined as part of a pod specification and they can be used by the containers in the pod to read and write data.
When a pod is deleted the associated volumes are also deleted by default.
However if the data in a volume needs to persistent even if the pod is deleted, it can be done by creating a persistent volume claim.
Kubernetes also provides an API that can be used to interest with the cluster allowing for the creation, update and deleting of objects as well as the retrieval of information about the cluster.

Kubernetes also provides several features for scaling and self-healing including automatic scaling based on resource usage and self-healing by automatically replacing failed pods.

Kustomize...
Kustomize is an open-source tool that allows for customizing and generated kubernetes manifests.
It provides a way to manage and organize kubernetes resources in a more efficient way by allowing for the separation of common and environment specific configurations.
Kustomize uses a simple and flexible set of rules to customize and generated kubernetes resources.
It works bu applying patches to the original kubernetes resource files, which are defined in a separate file called 'kustomization.yaml'.
The patches can be used to add remove or modify fields in the resources and can also be used to create new resources.
Kustomize also allows for the use of overlays which are used to apply different configurations to different environments, such as development, staging and production.
This allows for the separation of common and environment specific configurations and makes it easy to manage and manage/organize resources.
Kustomize allows supports the use of external tools such as kube-builder, kustomize-steps and k-sonnet to help manage and organize the resources.
Monitoring...
When the application is accessed by the users some logs and metrics will be generated.
We can filter them and know how, where, who are accessing our application.
We can also get the metrics of our server usage, the application requests etc. and we can troubleshoot, improve and audit the reports.
We can also enable beats like heart beat, so that we can get detailed information about our server/application states at all the time.
We can also trace the application while the user is accessing the application while the user is accessing the application , so that we can know what code is running when user is interacting and time taken by code to compile.
This analysis will help the developers to know the bugs and how to improve the performance.
Service Level Objective (SLO)
Service level objective is a target or a goal that you set for the performance and available of your service.
Service level Indicator
Service level indicator is a metric or measurement that you use to track the performance of the service.
The SLO is the target to achieve and SLI is the metric you use to measure your progress towards that target.

Package Registries
A package registry is a central repository that stores and distributed softwares packages, typically in the form of binary code package registries are commonly used in software development to make it easier for developers to share and reuse code and to manage dependencies between different packages.
Public Package Registries
These registries such as 'npm' or 'pypi' or 'maven central' etc are publicly available and can be used by anyone to download and share packages.
Private Package Registry
These registries are used by organizations to store and distribute internal packages and are typically only accessible to members of the organization.
Cloud based package registries
These registries are provided by cloud providers and are used to distributed packages for use in cloud based environments, like AWS Elastic Container Registry, Azure container Registry.
Package registries can be integrated with other tools such as continuos integration and continuos deployment (CI/CD) pipelines to automate the process of building and deploying software.

Scripting...
Infrastructure , CI/CD, Monitor tools uses scripting to create and maintain servers and services etc.
Scripting can be used to automate the process of backing up and recovering data.
This can be including creating regular backups , storing them in different locations and recovering data in case of failure.
Scripting can be used to automate repetitive tasks such as creating and managing user accounts, managing software account updates and automating deployments.
Scripting can be used to create custom plugins or integrating that can be used to extend the functionality of different tools and integrate them with other platforms.


Agile...
Agile is a methodology for software development that emphasizes flexibility and rapid iteration.
It is based on the agile manifests, a set of guiding values and principles for agile software development.
One of the most popular methodologies that implement the agile principles is 'Scrum'.
Scrum is framework for managing and completing complex projects and it is often used for software development.
It is based on a set of roles, events and artifacts that are used to organized and managed the work.
The key roles in Scrum
Product owner
Responsible for representing the stake holders and setting the priorities for project.
Scrum Master
Responsible for facilitating the scrum process and removing any obstacles that may impede process.
Development Team
Responsible for delivering potentially releasable increments of the products at the end of each sprint.
The key events in Scrum
Sprint
A time-boxed period of usually one or two weeks, in which the team works to deliver a potentially releasable increment of the product.
Sprint Planning
A meeting held at the beginning of the each sprint to plan the work for the upcoming sprint
Daily Scrum
A meeting help to synchronize the work and identify any obstacles.
Sprint Review
A meeting held at the end of the each sprint to review the work and plan the next sprint.
Sprint Retrospective
A meeting held at the end of each sprint to reflect on the previous sprint and identify ways to improve.
The key artifacts in Scrum
Product Backlog
A prioritized test of items that need to be done in order to deliver the product.
Sprint Backlog
A list of items that the team has committed to complete during the current sprint.
Increment
A potentially releasable version of the product that is delivered at the end of each sprint.
Terraform...
Terraform is a tool for infrastructure as code that allows to define and provision infrastructure using code.
It uses a domain specific language called 'Hashicorp Configuration Language' to define the desired state of the infrastructure.
Using terraform, users can define the resources they want to provision, such as virtual machines, load balancers, servers, databases,etc,..
Then Using terraform we can create and manage those resources on various cloud providers like AWS, Azure, GCP and more.
Terraform allows you to define your infrastructure as code and then use that code to provision and manage your infrastructure.
Terraform supports multiple cloud providers making it easy to provision and manage infrastructure across different environments.
Terraform configuration files can be stored in version control systems, such as git will allows for better collaboration , tracking of changes and roll back capabilities.
Terraform modules can created and reused to simplify the process of provision similar infrastructure.
Terraform can be integrated with other tools such as continuos integration and continuos deployment (CI/CD) pipelines to automate the process of provisioning and managing infrastructure.
Terraform keeps track of the current state of the infrastructure and can detect and apply changes automatically.
When you run terraform, it reads the configuration files and compares the defined state to the current which is stored in a file called the state file.
If there are any differences, terraform will make the necessary changes to bring the actual state in line with the define state. This process is called planning.
Once the plan is created, you can review it to make sure that the changes will have the desired effect and then apply the changes.
Terraform will then make the necessary API calls to the cloud providers to create, update or delete resources are needed.
Terraform also supports the concept of modules which are reusable collections of resources that can be easily shared and reused across different configurations.
This allows for better organization and simplifies the process of provisioning similar infrastructure.
Terraform also provides a way to manage the state of the infrastructure in a centralized way, this state is called the "state file" and its stored in a remote location usually in a cloud storage, this allows for collaboration among teams and the possibility of rollbacks.

Tests in Devops pipeline...
Testing is an important part of any devops pipeline, as it helps to ensure that the software is correct and meets the required quality standards.
In a devops pipeline, tests are typically run at different stages to catch and fixes errors as early as possible.
Unit tests
Unit tests are typically run as part of the build process , to ensure that the code compiles correctly and that individual units are working as expected.
Unit tests can be automated and are often run on a continuos basis, every time code is committed to the source control repository.

Integration Tests
These are tests check that different units of code work together correctly.
They are used to test interacts between different components of the software are integrated and functioning properly.
These tests are typically more complex than unit tests and may take longer to run.
Functional Tests
These tests check that the software is working as expected from a user's perspective.
They can include acceptance tests which ensure that the software meets the requirements and specifications set out bu the stake holders and system tests, which check that the software works correctly when integrated with other systems.
Acceptance Tests
These tests are usually done by the client or end-user to ensure the product meet their requirement.
They are designed to check the system against a set of acceptance criteria such as performance, security and usually.
Performance Tests
These tests measure how the system behaves under certain conditions, how much resources it consumes and how it responds to different leads.
This can include load testing, which simulates a high number of users accessing the system at the same time, stress testing which simulates heavy usage of the system over a prolonged period of time and scalability testing, which is used to determine how well the system can handle increases in usage.
Security Tests
These test check that the software is secure and it cannot be easily compromised by attackers.
This can be including penetration testing, which simultaneously an attackers attempting to break into the system and system compiles with relevant security regulations and standards.
Compliance Tests
These are testing that the software follows the regulations, standards or laws that are mandatory for the industry or laws that are mandatory for the industry or domain.
This can be HIPAA for healthcare or PCI-DSS for payment systems.
Smoke Tests
These tests are used to quick determine whether the system is in a working state.
They are typically a small set of tests that are run quickly and are designed to catch major issues that would prevent the system from being used.
All of these tests can be automated and integrated into the development, pipeline to ensure that changes to the code are thoroughly tested before they are deployed to production.


Git - Global Information Tracker...
Git is a free open source tool distributed version control system (VCS)
Git stores and manages projects as a series of the changes.
It enables developers to work on the same code base simultaneously, without stepping on each other's toes.
This is made possible through a process called 'Branching'.
This allows multiple people to work on the same project without disrupting the main codebase.
Git also has robust support for merging changes from multiple branches back into the main branches, resolving conflicts that may arise in the process.
Stages in Git
The first stage in the working directory where you make changes to the files in your repository.
The next stage is the staging area also known as 'index'.
This is where you stage the changes , which means that you are preparing to commit them to the repository.
When you stage a change, you are telling git to include it in the next commit you make.
The final stage is that the repository itself.
When you commit a change , you are taking the changes that you have staged and permanently storing them in the repository.
Commit Messages in Git
In Git, Commit messages are used to describe the changes that have been made in a commit.
A commit message should be a brief description of the changes that have been made, written in a clear and concise manner.
When looking back at the commit history of a repository, commit messages help to explain why a particular change was made.
They help to document the history of a project.
A well-written commit message can serve as a useful reference for anyone looking back at the commit message history of a project, as it provides a clear and concise summary of that changes that were made.
Git Branches
In Git, a branch is a separate line of development.
When you create a branch you are creating a copy of the codebase that you can work on without affecting the main branch.
Branches enables you to experiment with new features or changes without risking or breaking the main codebase.
It is easy to switch between different lines of development to work on different environments.
git branch <name>
This is the command used to create new branches.
git checkout <name>
This is the command used to change current branch.
Once the changes are added to the branch and ready to merge then back into the main codebase we can use 'git merger' command to merge the changes from the new branch into the main branch.
Git Stash
In Git, Stash is used to temporarily store changes that you have made to the working directory,
This is useful when we need to switch branches or restore our working directory to a previous state, but we don't want to commit your changes or close the changes.
git stash
This is the command will save the changes to a temporary storage area and restore your working directory to its previous state.
When you are ready to apply the stashed changes, you can use 'git stash pop' command to apply the changes and remove them from the stash.
You can use the 'git stash apply' command to apply the changes without removing them from the stash.
Git Fetch
Git fetch command is used to download content from a remote repository.
The command retrieves commits, files and refs from a remote repository and stores them in the local repository.
git fetch <remote-alias> <branch>
It does not modify your local branches, and it does not merge the changes into your local repository automatically.
Git Pull
The pull command is used to fetch and download content from a remote repository and immediately update the local repository with changes to match the content.
The command pull is a combination of git fetch and git merge.
git pull <remote-alias> <branch>
Here is the name of the repository and is the name of the branch that you want to pull changes from.
The pull command is a convenient way to update local repository with the latest changes from a remote repository.
It is generally considered a good practice to use the git fetch command instead, as it allows you to review and merge the changes at your own pace rather than automatically merging them.
Git push
The push command is used to upload local repository content to a remote repository.
The git push command is used to send the commits to a remote repository such as server or another collaborator local repository.
git push <remote-alias> <branch>
It is essential part of the git workflow and is used to keep the remote repository up date with the local repository.
Fetch vs Pull
The man difference between fetch and pull is that
The fetch downloads the changes from remote repository but does not automatically merges them into the local repository.
The pull downloads the changes and automatically merges them into the local repository.
Git Cherry-Pick
The cherry-pick command is used to apply the changes introduced by a specific commit to your current branch.
The cherry-pick is useful when you want to selectively apply changes from one branch to another , rather than merging the entire branch.
git cherry-pick <commit-id>
Git Rebase
The rebase command is used to incorporate changes from one branch into a branch of other.
It is used to apply a series of commits from a branch on top of another branch rather than merging the branches.
The git rebase command is often used to keep a branch up to date with the latest changes from the upstream branch.
Git merge
Merging is the process of combining the changes from one branch into another branch.
When you merge a branch you are taking the changes from the branch and applying them to the target branch.
Git Fast-Forward Merge
A Fast-Forward is the simple type of merge .
It occurs when the target branch has not diverged from the source branch and git can simply move the pointer of the target branch to point to the latest commit on the source branch.
A three-way merge on the other hand occurs when the target branch has diverged from the source branch.
In this case, Git must create a new commit that combines the changes from both branches.
This is also known as 'merge commit'.
git merge <branch-name>
Cherry-Pick vs Merge
The main difference between cherry-pick and merge is that cherry-pick allows you to selectively pick and apply changes from specific commit, while merge combines the changes from an entire branch.
Cherry-pick is useful when you want to selectively apply changes from one branch to another, rather than merging the entire branch.
Merge combines all the changes from one branch into another branch.
When you merge a branch you are applying all the commits on that branch to the target branch.
Summary
•	Git init: Initializes a new git repository.
•	Git clone: Clones an existing git repository.
•	Git add: Adds files to the staging area.
•	Git commit: Commits changes to the local repository.
•	Git push: Pushes commits to a new or existing remote repository
•	Git pull: Pulls changes from existing repository.
•	Git fetch: Downloads changes from a remote repository, but does not automatically merge them.
•	Git Merge: Merges changes from one branch into another branch.
•	Git Rebase: Applies a series of commit from one branch on top of another branch.
•	Git Cherry-Pick: Applies the changes from a specific commit to the current branch.
•	Git log: Shows the commit history for a repository.
•	Git diff: Shows the difference between two commits or the changes in the staging area.

                                           devsecops
Software composition analysis (SCA) is an automated process that identifies the open source software in a codebase.
This analysis is performed to evaluate security, license compliance, and code quality.
Companies need to be aware of open source license limitations and obligations.
Tracking these obligations manually became too arduous of a task—and it often overlooked code and its accompanying vulnerabilities. An automated solution, SCA, was developed, and from this initial use case, it expanded to analyze code security and quality.

In a modern DevOps or DevSecOps environment, SCA has galvanized the “shift left” paradigm.
Earlier and continuous SCA testing has enabled developers and security teams to drive productivity without compromising security and quality.

