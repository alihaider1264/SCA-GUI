#include <Wt/WTemplate.h>
#include <Wt/WText.h>
#include <Wt/WBreak.h>
#include <Wt/WContainerWidget.h>
#include <Wt/WFileUpload.h>
#include <Wt/WProgressBar.h>
#include <Wt/WImage.h>
#include <Wt/WLink.h>
#include <Wt/WCssDecorationStyle.h>
#include <Wt/WLineEdit.h>
#include <Wt/WPushButton.h>
#include <Wt/WApplication.h>
#include <Wt/WGroupBox.h>
#include <Wt/WColor.h>
#include <Wt/WTable.h>
#include <Wt/WTableCell.h>
#include <iostream>
#include <stdlib.h>




class teacherPage : public Wt::WApplication 
{
    public:
    teacherPage(const Wt::WEnvironment& env);

    private:
    Wt::WText *title;
    Wt::WText *searchNumLabel;
    Wt::WText *searchNameLabel;
    Wt::WLineEdit *searchNum;
    Wt::WLineEdit *searchName;
    Wt::WPushButton *searchButton;
    Wt::WTable *table;


};

teacherPage::teacherPage(const Wt::WEnvironment& env)
    : Wt::WApplication(env)
    {


setTitle("TeacherPage");

auto container = std::make_unique<Wt::WContainerWidget>();
container->resize(1280,1920);


Wt::WGroupBox *box = root()->addNew<Wt::WGroupBox>("Please neter the assignment number and student name you would like to search for.");
box->addStyleClass("centered-example");
box->addNew<Wt::WText>("<b>Student Name:</b>");
box->addNew<Wt::WLineEdit>("");
box->addNew<Wt::WBreak>();
box->addNew<Wt::WText>("<b>Assignment Number:</b>");
box->addNew<Wt::WLineEdit>("");
box->addNew<Wt::WBreak>();
box->addNew<Wt::WPushButton>("Search");
   /* struct Student {
        std::string stuName;
        int givenID;
        std::string stuEmail;
        int assignmentNum;

        Student(const std::string& aName, const std::string anEmail, int gID, int aNum) : stuName(aName), stuEmail(anEmail), givenID(gID), assignmentNum(aNum)
        {}
    };

    Student students[] = {
        Student("James Brennan", "bren0193@fredonia.edu", 00001, 1),
        Student("Brennan James", "bren0192@fredonia.edu", 00002, 2)
    };
    
    auto table = std::make_unique<Wt::WTable>();
    table->setHeaderCount(1);
    table->setWidth(Wt::WLength("80%"));

    table->elementAt(0, 0)->addNew<Wt::WText>("Full Name");
    table->elementAt(0, 1)->addNew<Wt::WText>("Email Address");
    table->elementAt(0, 2)->addNew<Wt::WText>("Given ID");
    table->elementAt(0, 3)->addNew<Wt::WText>("Assignments Submitted");

    for (unsigned int i = 0; i < 4; i++) {
        Student& student = students[i];
        int row = i + 1;

        table->elementAt(row, 0)
        ->addNew<Wt::WText>(Wt::WString("{1}").arg(row));
    table->elementAt(row, 1)
        ->addNew<Wt::WText>(student.stuName);
    table->elementAt(row, 2)
        ->addNew<Wt::WText>(student.stuEmail);
    table->elementAt(row, 3)
        ->addNew<Wt::WLineEdit>(Wt::WString("{1}").arg(student.givenID));
    table->elementAt(row, 4)
        ->addNew<Wt::WLineEdit>(Wt::WString("{1}").arg(student.assignmentNum));
*/

    }


/*

Wt::WText *title = root()->addNew<Wt::WText>("<h1>Teacher Page</h1>");
title = root()->addNew<Wt::WText>();
title->setMargin(620, Wt::Side::CenterX | Wt::Side::CenterY);


Wt::WText *seachNumLabel = root()->addNew<Wt::WText>("<b>Please enter the assignment number you would like to search for.</b>");
searchNumLabel = root()->addNew<Wt::WText>();


Wt::WLineEdit *searchNum = root()->addNew<Wt::WLineEdit>("");
searchNum = root()->addNew<Wt::WLineEdit>();

root()->addNew<Wt::WBreak>();

Wt::WText *searchNameLabel = root()->addNew<Wt::WText>("<b>Please enter the student's name you would like to search for.</b>");
searchNameLabel = root()->addNew<Wt::WText>();

Wt::WLineEdit *searchName = root()->addNew<Wt::WLineEdit>("");
searchName = root()->addNew<Wt::WLineEdit>();

root()->addNew<Wt::WBreak>();

Wt::WPushButton *searchButton = root()->addNew<Wt::WPushButton>("Search");
searchButton = root()->addNew<Wt::WPushButton>();
searchButton->setMargin(640, Wt::Side::CenterX | Wt::Side::Right);




    }
*/

        int main(int argc, char **argv)
{
    return Wt::WRun(argc, argv, [](const Wt::WEnvironment& env) {
      return std::make_unique<teacherPage>(env);
    });
}