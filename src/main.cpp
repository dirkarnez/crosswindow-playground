#define XWIN_WIN32 1
#include "CrossWindow/CrossWindow.h"

int main()
{
    // 🖼️ Create Window Description
    xwin::WindowDesc windowDesc;
    windowDesc.frame = false;
    windowDesc.width = 1280;
    windowDesc.height = 720;

    bool closed = false;
    
    // 🌟 Initialize
    xwin::Window window;
    xwin::EventQueue eventQueue;

    if (!window.create(windowDesc, eventQueue))
    { return -1; }

    // 🏁 Engine loop
    bool isRunning = true;

    while (isRunning)
    {
        // ♻️ Update the event queue
        eventQueue.update();

        // 🎈 Iterate through that queue:
        while (!eventQueue.empty())
        {
            const xwin::Event& event = eventQueue.front();

            if (event.type == xwin::EventType::MouseMove)
            {
                const xwin::MouseMoveData mouse = event.data.mouseMove;
            }
            if (event.type == xwin::EventType::Close)
            {
                window.close();
                isRunning = false;
            }

            eventQueue.pop();
        }
    }
    return 0;
}
