using System;

namespace Chmoky.Presentation.Models
{

    public class TopRecordModel
    {
        public long RowNum { get; set; }
        public AuthorModel Author { get; set; }
        public Nullable<int> count { get; set; }
        public Nullable<long> total { get; set; }
        public Nullable<long> min { get; set; }
        public Nullable<long> max { get; set; }
        public Nullable<long> avg { get; set; }
    }
}