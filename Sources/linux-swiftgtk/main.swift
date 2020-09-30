import GLibObject
import CGtk
import Gtk

let status = Application.run { app in
    let window = ApplicationWindowRef(application: app)
    window.title = "List Demo"
    window.setDefaultSize(width: 640, height: 360)

    let i = TreeIter()
    let store = ListStore(.string, .boolean)
    store.append(asNextRow: i, "First Row", false)
    store.append(asNextRow: i, "Second Row", true)
    store.append(asNextRow: i, "Third Row", false)
    let columns = [
        ("Title", "text",   CellRendererText()),
        ("Check", "active", CellRendererToggle())]
        .enumerated().map { (i: Int,
                    c: (title: String, attr: PropertyName, renderer: CellRenderer))
                    -> TreeViewColumn in
            TreeViewColumn(i, title: c.title, renderer: c.renderer, attribute: c.attr)
        }
    let listView = ListView(model: store)
    listView.append(columns)
    window.add(widget: listView)
    window.showAll()
}

guard let status = status else {
    fatalError("Could not create Application")
}
guard status == 0 else {
    fatalError("Application exited with status \(status)")
}

/*
// help: https://github.com/TomasLinhart/SwiftGtk#demo

import SwiftGtk

let app = Application(applicationId: "com.example.application")
app.run { window in
    window.title = "Hello World"
    window.defaultSize = Size(width: 400, height: 400)
    window.resizable = true

    let button = Button(label: "Press Me")
    button.clicked = { _ in
        let newWindow = Window(windowType: .topLevel)
        newWindow.title = "Just a window"
        newWindow.defaultSize = Size(width: 200, height: 200)
        let labelPressed = Label(text: "Oh, you pressed the button.")
        newWindow.add(labelPressed)

        newWindow.showAll()
    }

    window.add(button)
}
*/
