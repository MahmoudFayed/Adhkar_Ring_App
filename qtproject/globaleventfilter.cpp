// globaleventfilter.cpp
#include "globaleventfilter.h"



void onEventProcessed() {
    forceHideKeyboard();
}

GlobalEventFilter::GlobalEventFilter(QObject* parent) : QObject(parent) {}

GlobalEventFilter::~GlobalEventFilter() {}

bool GlobalEventFilter::eventFilter(QObject* watched, QEvent* event) {
    // Process the event normally
    bool result = QObject::eventFilter(watched, event);

    // Only run for specific event types
    switch (event->type()) {
        case QEvent::MouseButtonPress:
        case QEvent::KeyPress:
        case QEvent::User: // Custom events
            onEventProcessed();
            break;
        default:
            // Ignore high-frequency events like QEvent::Paint
            break;
    }

    return result;
}