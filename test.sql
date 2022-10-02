create table project (id bigint not null auto_increment, name varchar(255), session_id bigint, source_id bigint, primary key (id)) engine=InnoDB
create table project_manager (project_id bigint not null, user_id bigint not null) engine=InnoDB
create table project_review (id bigint not null auto_increment, comment varchar(255), project_id bigint, primary key (id)) engine=InnoDB


insert into project (name) values ('project1');
insert into project (name) values ('project2');
insert into project (name) values ('project3');

insert into project_review (comment, project_id) values ('project2 comment', 2);
insert into project_review (comment, project_id) values ('project3 comment', 3);

select * from project p join project_review pr on p.id = pr.project_id;

alter table project add comment varchar(255);

select pr.comment from project p join project_review pr on p.id = pr.project_id;


update project p1, (select p2.id, p2.comment from (select p.id, pr.comment from project p join project_review pr on p.id = pr.project_id) p2) p3
set p1.comment = p3.comment
where p1.id = p3.id

