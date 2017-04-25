using System;
using System.Collections.Generic;

namespace Chmoky.Presentation.Models
{
    public class MessageModel
    {
        public Nullable<int> count { get; set; }
        public Nullable<int> textLength { get; set; }
        public Nullable<int> min { get; set; }
        public Nullable<int> max { get; set; }
        public Nullable<int> avg { get; set; }
        public Nullable<int> total { get; set; }
        public IEnumerable<MessageRecordModel> rows { get; set; }
    }
}