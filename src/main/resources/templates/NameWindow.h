#pragma once


#include <QWidget>
#include "I${NAME}Presenter.h"
#include "ui/base/router/abstractrouterwidget.h"
#include "I${NAME}View.h"
#include "ui/windowclz.h"
#include "ui_${NAME}Window.h"

class ${NAME}Window final : public AbstractRouterWidget, public I${NAME}View {
    Q_OBJECT
public:
    Q_INVOKABLE explicit ${NAME}Window(const QVariant& data, QWidget* parent = nullptr);
    ~${NAME}Window() override;
    void onNavigateResult(const QVariant& data) override;
// private Q_SLOTS:

private:
    Ui::${NAME}Window ui{};
    I${NAME}Presenter* presenter{};
    ${NAME}WindowParam param;

    static int typeId;


protected:
    void onViewLoad() override;
    void onReshow() override;
    void onHidden() override;
    void runRouterEvent(const QString& event, const QVariant& data) override;

public:
    QObject* holder() override;
    void showErrorMsg(const QString& msg) override;

};