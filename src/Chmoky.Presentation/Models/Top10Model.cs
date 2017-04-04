using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chmoky.Presentation.Models
{
    public class Author
    {
        public string SkypeID { get; set; }
        public string SkypeNames { get; set; }
    }

    public class Top10Record
    {
        public long RowNum { get; set; }
        public string FullName { get; set; }
        public Author Author { get; set; }
        public Nullable<int> count { get; set; }
        public Nullable<long> total_just_text { get; set; }
        public Nullable<long> min_just_text { get; set; }
        public Nullable<long> max_just_text { get; set; }
        public Nullable<long> avg_just_text { get; set; }
    }

    public class Top10Model
    {
        public Nullable<int> count { get; set; }
        public Nullable<int> textLength { get; set; }
        public Nullable<int> min { get; set; }
        public Nullable<int> max { get; set; }
        public Nullable<int> avg { get; set; }
        public Nullable<int> total { get; set; }
        public IEnumerable<Top10Record> rows { get; set; }
    }
}