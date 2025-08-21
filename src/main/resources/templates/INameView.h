#pragma once
#include "qstring.h"
class I${NAME}View {
public:
    virtual ~I${NAME}View() = default;
    virtual QObject* holder() = 0;
    virtual void showErrorMsg(const QString& msg) = 0;
};
