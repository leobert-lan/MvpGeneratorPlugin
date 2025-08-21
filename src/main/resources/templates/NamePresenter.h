#pragma once


#include "I${NAME}Presenter.h"
#include "ui/base/concurrent/MainThread.h"
#include "ui/stimulation/library/I${NAME}View.h"

#include "model/Repository.h"

class ${NAME}Presenter final : public I${NAME}Presenter {
public:
    explicit ${NAME}Presenter(I${NAME}View* m_view): mView(m_view), repository(Repository::getInstance()),
                                                                mainThread(MainThread::forQObject(mView->holder()))
    {
    }

private:
    I${NAME}View* mView;
    Repository* repository;
    MainThread* mainThread;
};