using System;

namespace Chmoky.Presentation.Models
{

    public class MessageRecordModel
    {
        public long RowNum { get; set; }
        public AuthorModel Author { get; set; }
        public Nullable<System.DateTime> timestamp { get; set; }
        public string text { get; set; }
        public Nullable<long> len { get; set; }
        public Nullable<int> type { get; set; }
        public string identities { get; set; }
    }
}