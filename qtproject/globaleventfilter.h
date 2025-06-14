// globaleventfilter.h
#ifndef GLOBALEVENTFILTER_H
#define GLOBALEVENTFILTER_H

#include <QObject>
#include <QEvent>
#include <QDebug>

// Your custom function to run after each event
void onEventProcessed();
void forceHideKeyboard() ;


 
// Minimal event filter class
class GlobalEventFilter : public QObject {
    Q_OBJECT
public:
    explicit GlobalEventFilter(QObject* parent = nullptr);
    virtual ~GlobalEventFilter();  // Required for vtable

    bool eventFilter(QObject* watched, QEvent* event) override;
};

#endif // GLOBALEVENTFILTER_H