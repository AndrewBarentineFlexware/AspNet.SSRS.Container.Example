using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AspNet.SSRS.Container.Example.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public FileResult DownloadPdf(bool useFont)
        {
            ReportViewer report = new ReportViewer();
            report.ProcessingMode = ProcessingMode.Local;
            string fileName = "Example_HelmetCondensed.pdf";
            
            if(useFont)
            {
                report.LocalReport.ReportPath = "Sample_With_Font.rdlc";
            }
            else
            {
                report.LocalReport.ReportPath = "Sample_Without_Font.rdlc";
                fileName = "Example_default.pdf";
            }
            
            ReportParameter param = new ReportParameter("VehicleID", "123");
            report.LocalReport.SetParameters(param);

            // Sample byte array (replace this with your actual byte array)
            byte[] reportBytes = report.LocalReport.Render("PDF");

            // Convert byte array to MemoryStream
            MemoryStream pdfStream = new MemoryStream(reportBytes);

            // Return the file as a FileStreamResult
            return File(pdfStream, "application/pdf", fileName);
        }
    }
}