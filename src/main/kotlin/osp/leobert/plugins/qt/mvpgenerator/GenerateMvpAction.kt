package osp.leobert.plugins.qt.mvpgenerator

import com.intellij.openapi.actionSystem.AnAction
import com.intellij.openapi.actionSystem.AnActionEvent
import com.intellij.openapi.actionSystem.CommonDataKeys
import com.intellij.openapi.application.ApplicationManager
import com.intellij.openapi.ui.Messages
import com.intellij.openapi.vfs.VirtualFile
import java.io.InputStreamReader

class GenerateMvpAction : AnAction("Generate MVP Stubs") {
    override fun actionPerformed(e: AnActionEvent) {
        val project = e.project ?: return
        val baseDir = e.getData(CommonDataKeys.VIRTUAL_FILE) ?: return

        val dialog = InputDialog(project, "Enter keyword (e.g. StimulationLibrary):", "MVP Generator")
        if (!dialog.showAndGet()) return
        val keyword = dialog.inputText.trim()
        if (keyword.isEmpty()) return

        val templates = mapOf(
            "I${'$'}{keyword}Presenter.h" to "/templates/INamePresenter.h",
            "I${'$'}{keyword}View.h" to "/templates/INameView.h",
            "${'$'}{keyword}Window.ui" to "/templates/NameWindow.ui",
            "${'$'}{keyword}Presenter.cpp" to "/templates/NamePresenter.cpp",
            "${'$'}{keyword}Presenter.h" to "/templates/NamePresenter.h",
            "${'$'}{keyword}Window.cpp" to "/templates/NameWindow.cpp",
            "${'$'}{keyword}Window.h" to "/templates/NameWindow.h",
        )

        ApplicationManager.getApplication().runWriteAction {
            templates.forEach { (fileName, templatePath) ->
                try {
                    val content = loadTemplate(templatePath).replace("\${NAME}", keyword)
                    val fName = fileName.replace("\${keyword}",keyword)
                    val newFile = baseDir.findOrCreateChildData2(this, fName)
                    newFile.setBinaryContent(content.toByteArray())
                } catch (e: Exception) {
                    e.printStackTrace()
                }
            }
        }

        Messages.showInfoMessage(project, "MVP stubs generated for $keyword", "Success")
    }

    private fun loadTemplate(path: String): String {
        val stream = javaClass.getResourceAsStream(path) ?: return ""
        return InputStreamReader(stream,Charsets.UTF_8).readText()
    }

    private fun VirtualFile.findOrCreateChildData2(requestor: Any, name: String): VirtualFile {
        return this.findChild(name) ?: this.createChildData(requestor, name)
    }
}
