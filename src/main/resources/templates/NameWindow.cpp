#include "${NAME}Window.h"

#include "${NAME}Presenter.h"
#include "ui/base/router/qrouter.h"


int ${NAME}Window::typeId = qRegisterMetaType<${NAME}Window*>();

${NAME}Window::${NAME}Window(const QVariant& data, QWidget* parent)
    : AbstractRouterWidget(data, parent), param(data.value<${NAME}WindowParam>())
{
    ui.setupUi(this);


    presenter = new ${NAME}Presenter(this);

    // load patient detail
    if (param.getPatientId() >= 1)
    {
        QRouter::of().postEventToRoot(RouterEvent::SET_PAGE_NAME,"刺激库");
        // presenter->loadPatientDetail(param.getPatientId());
    }
    else
    {
        QRouter::of().postEventToRoot(RouterEvent::SET_PAGE_NAME,"刺激库");
    }
}

${NAME}Window::~${NAME}Window()
{
    delete presenter;
}

void ${NAME}Window::onNavigateResult(const QVariant &data)
{

}

void ${NAME}Window::onViewLoad()
{
    AbstractRouterWidget::onViewLoad();
}

void ${NAME}Window::onReshow()
{
    AbstractRouterWidget::onReshow();
}

void ${NAME}Window::onHidden()
{
    AbstractRouterWidget::onHidden();
}

void ${NAME}Window::runRouterEvent(const QString& event, const QVariant& data)
{
    AbstractRouterWidget::runRouterEvent(event, data);
}

QObject* ${NAME}Window::holder()
{
    return this;
}

void ${NAME}Window::showErrorMsg(const QString& msg)
{
}