package osp.leobert.plugins.qt.mvpgenerator

import com.intellij.openapi.project.Project
import com.intellij.openapi.ui.DialogWrapper
import javax.swing.*

class InputDialog(project: Project, private val message: String, title: String) : DialogWrapper(project) {
    private val inputField = JTextField()

    init {
        setTitle(title)
        init()
    }

    override fun createCenterPanel(): JComponent {
        val panel = JPanel()
        panel.layout = BoxLayout(panel, BoxLayout.Y_AXIS)
        panel.add(JLabel(message))
        panel.add(inputField)
        return panel
    }

    val inputText: String
        get() = inputField.text
}
