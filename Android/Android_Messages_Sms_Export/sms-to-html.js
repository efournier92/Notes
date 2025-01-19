// ----------------
//  Name          : sms-to-html
//  Author        : E Fournier
//  Description   : Exports an SMS conversations from an XML backup to HTML
//  Execute In    : Browser Console
//  URL           : https://synctech.com.au/view-backup
// ----------------

function exportHtml(filePrefix) {
  const exportDate = new Date().toISOString().split('T')[0]
  const fileType = 'html';
  const fileName = `Messages_${filePrefix}_${exportDate}.${fileType}`;

  const htmlBlob = getHtmlBlob(filePrefix, exportDate, fileType)

  downloadFile(htmlBlob, filePrefix, exportDate, fileType, fileName);
}

function getHtmlBlob(filePrefix, exportDate, fileType) {
  const messagesTable = document.querySelector('#backupViewerRecordsList table tbody')
  
  removeToolsMenu(messagesTable);

  const output = `<html>`
    + `<head>${getStyle()}</head>`
    + '<body>'
    + `<h1>${addSpaces(filePrefix)} | <i>Exported ${exportDate}</i></h1>`
    + messagesTable.innerHTML
    + '</body>'
    + '</html>';

  return new Blob([output], { type: fileType });
}

function removeToolsMenu(messagesTable) {
  const tableToolsMenuPattern = 'Download All Media';

  const tableToolsMenu = messagesTable.firstElementChild.querySelector('tr td span');
  
  if (!tableToolsMenu || !tableToolsMenu.innerHTML || !tableToolsMenu.innerHTML.includes(tableToolsMenuPattern)) return;

  tableToolsMenu.remove();
}

function addSpaces(filePrefix) {
  return filePrefix.replace(/([a-z])([A-Z])/g, '$1 $2');
}

function downloadFile(htmlBlob, filePrefix, exportDate, fileType, fileName) {
  const a = document.createElement('a');
  a.download = fileName;
  a.href = URL.createObjectURL(htmlBlob);
  a.dataset.downloadurl = [fileType, a.download, a.href].join(':');
  a.style.display = "none";
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
  setTimeout(function() { URL.revokeObjectURL(a.href); }, 1500);
}

function getStyle() {
  return `
    <style>
      table {
        font-family: Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
      }

      table td, table th {
        border: 1px solid #ddd;
        padding: 8px;
      }

      table tr:nth-child(even){background-color: #EEEEEE;}

      table th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        background-color: #757575;
        color: white;
      }
    </style>
  `;
}

