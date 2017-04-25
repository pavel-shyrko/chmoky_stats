using AutoMapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Core.Objects;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Chmoky.Presentation.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index() { return View(); }

        public ActionResult Messages(string author) { return View(); }

        public ActionResult Contact() { return View(); }

        [HttpPost]
        public JsonResult GetTop(string currentDate, int offset, int limit, string search, string sort, string order)
        {
            var previous = DateTime.Parse(currentDate);

            var prevYear = previous.Year; 
            var prevMonth = previous.Month; 

            var startDate = new DateTime(prevYear, prevMonth, 1).ToUniversalTime();

            var currentYear = previous.AddMonths(1).Year;
            var currentMonth = previous.AddMonths(1).Month;

            var endDate = new DateTime(currentYear, currentMonth, 1).ToUniversalTime();

            using (var ctx = new Chmoky.DataAccess.ChmokyEntities())
            {
                var participants = new ObjectParameter("Participants", typeof(int));
                var textLength = new ObjectParameter("TextLength", typeof(int));
                var count = new ObjectParameter("Count", typeof(int));
                var min = new ObjectParameter("Min", typeof(int));
                var max = new ObjectParameter("Max", typeof(int));
                var avg = new ObjectParameter("Avg", typeof(int));

                var records = ctx.GetStatistics(startDate, endDate, offset, limit, sort, order,
                    participants, textLength, count, min, max, avg).ToList();

                var model = new Models.TopModel
                {
                    participants = participants.Value as int?,
                    count = count.Value as int?,
                    textLength = textLength.Value as int?,
                    min = min.Value as int?,
                    max = max.Value as int?,
                    avg = avg.Value as int?,
                    total = participants.Value as int?,
                    rows = Mapper.Map<IEnumerable<Models.TopRecordModel>>(records),
                };

                return Json(model, JsonRequestBehavior.DenyGet);
            }
        }

        [HttpPost]
        public JsonResult GetMessages(string author, string currentDate, int offset, int limit, string search, string sort, string order)
        {
            var previous = DateTime.Parse(currentDate);

            var prevYear = previous.Year;
            var prevMonth = previous.Month;

            var startDate = new DateTime(prevYear, prevMonth, 1).ToUniversalTime();

            var currentYear = previous.AddMonths(1).Year;
            var currentMonth = previous.AddMonths(1).Month;

            var endDate = new DateTime(currentYear, currentMonth, 1).ToUniversalTime();

            using (var ctx = new Chmoky.DataAccess.ChmokyEntities())
            {
                var participants = new ObjectParameter("Participants", typeof(int));
                var textLength = new ObjectParameter("TextLength", typeof(int));
                var count = new ObjectParameter("Count", typeof(int));
                var min = new ObjectParameter("Min", typeof(int));
                var max = new ObjectParameter("Max", typeof(int));
                var avg = new ObjectParameter("Avg", typeof(int));

                var records = ctx.GetMessages(author, startDate, endDate, offset, limit, /*sort, order,*/
                    participants, textLength, count, min, max, avg).ToList();

                var model = new Models.MessageModel
                {
                    participants = participants.Value as int ?,
                    count = count.Value as int?,
                    textLength = textLength.Value as int?,
                    min = min.Value as int?,
                    max = max.Value as int?,
                    avg = avg.Value as int?,
                    total = count.Value as int?,
                    rows = Mapper.Map<IEnumerable<Models.MessageRecordModel>>(records),
                };

                return Json(model, JsonRequestBehavior.DenyGet);
            }
        }

        [HttpPost]
        public JsonResult GetAuthorDetails(string author)
        {
            using (var ctx = new Chmoky.DataAccess.ChmokyEntities())
            {
                var authorDetails = ctx.FindAuthor(author).FirstOrDefault();
                var result = Mapper.Map<Models.AuthorModel>(authorDetails);
                return Json(result, JsonRequestBehavior.DenyGet);
            }
        }
    }
}