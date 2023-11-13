
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
#include <Wt/WLink.h>
#include <Wt/WMenu.h>
#include <Wt/WStackedWidget.h>
#include <Wt/WTextArea.h>
#include <string>


using namespace std;

class firstTest : public Wt::WApplication 
{
    public:
    firstTest(const Wt::WEnvironment& env);

    private:
    Wt::WApplication *app;
    Wt::WText *titleBox;
    Wt::WText *instructions;
    Wt::WText *out;
    Wt::WPushButton *Tbutton;
    Wt::WPushButton *submitButton;
    Wt::WPushButton *uploadButton;
    Wt::WText *Name;
    Wt::WText *assignmentNum;
    Wt::WText *EMail;
    Wt::WText *givenID;
    Wt::WFileUpload *fu;
    Wt::WMenu *menu;
    Wt::WGroupBox *box;
    std::string appName;
   



};

firstTest::firstTest(const Wt::WEnvironment& env) 
    : Wt::WApplication(env) 
{

setTitle("SCA Tool");

auto container = std::make_unique<Wt::WContainerWidget>();
container->setStyleClass("blue-box");
container->resize(1280,1920);


Wt::WApplication *app = new WApplication(env);


Wt::WText *titleBox = root()->addNew<Wt::WText>("<h1>SCA Tool</h1>");
titleBox = root()->addNew<Wt::WText>();
titleBox->setMargin(620, Wt::Side::CenterX | Wt::Side::CenterY);

Wt::WGroupBox *box = root()->addNew<Wt::WGroupBox>("Please enter all information below.");
box->addStyleClass("centered-example");
box->addNew<Wt::WText>("<b>Code to be submitted below.</b>");
box->addNew<Wt::WBreak>();
box->addNew<Wt::WText>("<b> Full Name:</b>");
box->addNew<Wt::WLineEdit>("");
box->addNew<Wt::WBreak>();
box->addNew<Wt::WText>("<b>Assignment Number:</b>");
box->addNew<Wt::WLineEdit>();
box->addNew<Wt::WBreak>();
box->addNew<Wt::WText>("<b>Email Address:</b>");
box->addNew<Wt::WLineEdit>("");
box->addNew<Wt::WBreak>();
box->addNew<Wt::WText>("<b>Given ID:</b>");
box->addNew<Wt::WLineEdit>("");
box->addNew<Wt::WBreak>();
Wt::WPushButton *uploadButton = box->addNew<Wt::WPushButton>("Submit");
uploadButton->setMargin(200, Wt::Side::CenterX);
Wt::WPushButton *Tbutton = box->addNew<Wt::WPushButton>("I Am a Teacher");
Tbutton->setLink(Wt::WLink("/SPTest/teacherPage.cpp"));
    


root()->addNew<Wt::WBreak>();


Wt::WFileUpload *fu = root()->addNew<Wt::WFileUpload>();
fu->setProgressBar(std::make_unique<Wt::WProgressBar>());
fu->setMargin(200, Wt::Side::CenterY);


uploadButton->clicked().connect([=] {
    fu->upload();
    uploadButton->disable();
});

fu->changed().connect([=] {
    fu->upload();
    uploadButton->disable();
    out->setText("File upload is changed.");
});

fu->uploaded().connect([=] {
    out->setText("File upload is finished.");
});

fu->fileTooLarge().connect([=] {
    out->setText("File is too large.");
});

root()->addNew<Wt::WBreak>();
    }


    int main(int argc, char **argv)
{
    return Wt::WRun(argc, argv, [](const Wt::WEnvironment& env) {
      return std::make_unique<firstTest>(env);
    });
}
