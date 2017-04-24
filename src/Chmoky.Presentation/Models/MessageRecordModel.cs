using System;

namespace Chmoky.Presentation.Models
{

    public class MessageRecordModel
    {
        public long RowNum { get; set; }
        public string FullName { get; set; }
        public AuthorModel Author { get; set; }
        public string just_html_text { get; set; }

        public long id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Nullable<System.DateTime> timestamp { get; set; }
        public string edited_by { get; set; }
        public Nullable<System.DateTime> edited_timestamp { get; set; }
        public Nullable<int> type { get; set; }
        public string identities { get; set; }
        public string original { get; set; }
        
        public Nullable<long> len_original { get; set; }
        public Nullable<long> len_just_text { get; set; }
        public string DispNames { get; set; }
    }
}