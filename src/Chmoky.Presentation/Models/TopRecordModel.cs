using System;

namespace Chmoky.Presentation.Models
{

    public class TopRecordModel
    {
        public long RowNum { get; set; }
        public string FullName { get; set; }
        public AuthorModel Author { get; set; }
        public Nullable<int> count { get; set; }
        public Nullable<long> total_just_text { get; set; }
        public Nullable<long> min_just_text { get; set; }
        public Nullable<long> max_just_text { get; set; }
        public Nullable<long> avg_just_text { get; set; }
    }
}