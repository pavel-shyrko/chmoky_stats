﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Chmoky.DataAccess
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class ChmokyEntities : DbContext
    {
        public ChmokyEntities()
            : base("name=ChmokyEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Message> Messages { get; set; }
        public virtual DbSet<SkypeUser> SkypeUsers { get; set; }
    
        public virtual ObjectResult<FindAuthor_Result> FindAuthor(string author)
        {
            var authorParameter = author != null ?
                new ObjectParameter("author", author) :
                new ObjectParameter("author", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<FindAuthor_Result>("FindAuthor", authorParameter);
        }
    
        public virtual ObjectResult<GetStatistics_Result> GetStatistics(Nullable<System.DateTime> startdate, Nullable<System.DateTime> enddate, Nullable<int> offSet, Nullable<int> limit, string sortColumn, string sortDirection, ObjectParameter participants, ObjectParameter textLength, ObjectParameter count, ObjectParameter min, ObjectParameter max, ObjectParameter avg)
        {
            var startdateParameter = startdate.HasValue ?
                new ObjectParameter("startdate", startdate) :
                new ObjectParameter("startdate", typeof(System.DateTime));
    
            var enddateParameter = enddate.HasValue ?
                new ObjectParameter("enddate", enddate) :
                new ObjectParameter("enddate", typeof(System.DateTime));
    
            var offSetParameter = offSet.HasValue ?
                new ObjectParameter("OffSet", offSet) :
                new ObjectParameter("OffSet", typeof(int));
    
            var limitParameter = limit.HasValue ?
                new ObjectParameter("Limit", limit) :
                new ObjectParameter("Limit", typeof(int));
    
            var sortColumnParameter = sortColumn != null ?
                new ObjectParameter("SortColumn", sortColumn) :
                new ObjectParameter("SortColumn", typeof(string));
    
            var sortDirectionParameter = sortDirection != null ?
                new ObjectParameter("SortDirection", sortDirection) :
                new ObjectParameter("SortDirection", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetStatistics_Result>("GetStatistics", startdateParameter, enddateParameter, offSetParameter, limitParameter, sortColumnParameter, sortDirectionParameter, participants, textLength, count, min, max, avg);
        }
    
        public virtual ObjectResult<GetMessages_Result> GetMessages(string author, Nullable<System.DateTime> startdate, Nullable<System.DateTime> enddate, Nullable<int> offSet, Nullable<int> limit, string sortColumn, string sortDirection, ObjectParameter participants, ObjectParameter textLength, ObjectParameter count, ObjectParameter min, ObjectParameter max, ObjectParameter avg)
        {
            var authorParameter = author != null ?
                new ObjectParameter("author", author) :
                new ObjectParameter("author", typeof(string));
    
            var startdateParameter = startdate.HasValue ?
                new ObjectParameter("startdate", startdate) :
                new ObjectParameter("startdate", typeof(System.DateTime));
    
            var enddateParameter = enddate.HasValue ?
                new ObjectParameter("enddate", enddate) :
                new ObjectParameter("enddate", typeof(System.DateTime));
    
            var offSetParameter = offSet.HasValue ?
                new ObjectParameter("OffSet", offSet) :
                new ObjectParameter("OffSet", typeof(int));
    
            var limitParameter = limit.HasValue ?
                new ObjectParameter("Limit", limit) :
                new ObjectParameter("Limit", typeof(int));
    
            var sortColumnParameter = sortColumn != null ?
                new ObjectParameter("SortColumn", sortColumn) :
                new ObjectParameter("SortColumn", typeof(string));
    
            var sortDirectionParameter = sortDirection != null ?
                new ObjectParameter("SortDirection", sortDirection) :
                new ObjectParameter("SortDirection", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetMessages_Result>("GetMessages", authorParameter, startdateParameter, enddateParameter, offSetParameter, limitParameter, sortColumnParameter, sortDirectionParameter, participants, textLength, count, min, max, avg);
        }
    }
}
